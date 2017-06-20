---
layout:     post
title:      "Interactive Brokers API with Python"
subtitle:   "Blog Week 10"
date:       2017-06-18 09:00:00 -0700
author:     "Ieronim E Oltean"
header-img: "img/post-bg-10.jpg"
---

<p>Welcome back, blog readers. It's been a few months and I've been hard at work getting jiggy with Python. Recently (April 2017) Interactive Brokers put out a new Python API. They already supported Java, C++, and some other languages, but I didn't know any of them. Since I've been learning Python anyway, I thought I would give it a try and see if I can make a trading algorithm.</p>
<p>Unfortunately, the IB API is kind of a pain in the ass to use. It's not as easy as just sending requests and receiving data. You have to monkey patch all of the different functions provided by IB to get them to do anything useful. For example, reqMktData takes 6 arguments and can be called as such:</p>
```python
app.reqMktData(1001, contract, "", False, False, [])
```
<p>You can call it, and Interactive Brokers will get the call and send you the data, but it won't print or show anywhere unless you monkey patch the tick wrappers to print out the tick types that get returned. So you have to go through a file with over a thousand lines of code to find the function you're looking for and then copy it, paste it, and patch it.</p>
<p>I have been trying to make the smallest possible script to request and receive data. Here is a <a href="https://gist.github.com/Goldtean/0f5bf70d5d2e2efb9a7061e39396c6be">gist</a>. Here is what you need to make it run:</p>
<p>1: The Interactive Brokers API installed & configured on your machine. The API needs to be enabled, local IP white listed, and the connection port must match your settings.</p>
<p>2: You need Python 3 installed.</p>
<p>3: You need market data access to whichever contracts you are requesting data for. In my example, I am using a VIX futures contract.</p>
<p>Let's go through the code. First we import everything:</p>
```python
from ibapi.wrapper import EWrapper
from ibapi.client import EClient
from ibapi.utils import iswrapper
from ibapi.common import *
from ibapi.contract import *
from ibapi.ticktype import *
```

<p>Then we init the app by taking in EWrapper and ECLient. Then we have to patch up error, tickPrice, tickSize, tickString, and tickGeneric. All we are doing is getting them to print.</p>

```python
class BasicApp(EWrapper, EClient):
  def __init__(self):
    EClient.__init__(self,self)

  def error(self, reqId: TickerId, errorCode:int, errorString:str):
    print('Error:', reqId, " ", errorCode, " ", errorString)

  @iswrapper
  def tickPrice(self, reqId: TickerId, tickType: TickType, price: float, attrib: TickAttrib):
    super().tickPrice(reqId, tickType, price, attrib)
    print("Tick Price. Ticker Id:", reqId, "tickType:", tickType, "Price:", price, "CanAutoExecute:", attrib.canAutoExecute, "PastLimit", attrib.pastLimit)

  @iswrapper
  def tickSize(self, reqId: TickerId, tickType: TickType, size: int):
    super().tickSize(reqId, tickType, size)
    print("Tick Size. Ticker Id:", reqId, "tickType:", tickType, "Size:", size)

  @iswrapper
  def tickString(self, reqId: TickerId, tickType: TickType, value: str):
    super().tickString(reqId, tickType, value)
    print("Tick string. Ticker Id:", reqId, "Type:", tickType, "Value:", value)

  @iswrapper
  def tickGeneric(self, reqId: TickerId, tickType: TickType, value: float):
    super().tickGeneric(reqId, tickType, value)
    print("Tick Generic. Ticker Id:", reqId, "tickType:", tickType, "Value:", value)
```
<p>You need to whitelist your local IP address and enable API access in your Interactive Brokers settings. They are off by default. You also need to login to your account with the API properly installed on your machine. You can go <a href="http://interactivebrokers.github.io/">here</a> to get it and follow the instructions if you haven't already. In this example, the connection port is set to 4001, and user id set to 0. The port needs to match your IB settings.</p>
<p>After that we create a contract and set it's symbol (stock ticker), security type (stocks, bonds, futures), exchange (can be set to SMART which is IB's smart router), and currency (usually USD). If you're creating a futures contract, you need to specify the contract expiration date.</p>
<p>After this, we can request market data using the reqMktData function. The first argument is the request ID, which can be set to any four digit number, the contract which we just created, and then two sets of False and an empty array. The Falses are for specific data types, and the array is for arguments.</p>
```python
def main():
  app = BasicApp()
  app.connect("127.0.0.1", 4001, 0)
  contract = Contract();
  contract.symbol = "VIX";
  contract.secType = "FUT";
  contract.exchange = "CFE";
  contract.currency = "USD";
  contract.lastTradeDateOrContractMonth = "20170621";
  app.reqMktData(1001, contract, "220", False, False, [])
  app.run()

if __name__ == '__main__':
  main()

```
<p>That's it! Now we can start the program and watch those ticks roll in.</p>

<p>If you're not interested in obscure futures contracts, you can request something like Tesla stock by changing the following lines of code:</p>
```python
  contract = Contract();
  contract.symbol = "VIX";
  contract.secType = "FUT";
  contract.exchange = "CFE";
  contract.currency = "USD";
  contract.lastTradeDateOrContractMonth = "20170621";
```
<p>To this:</p>
```python
  contract = Contract();
  contract.symbol = "TSLA";
  contract.secType = "STK";
  contract.exchange = "SMART";
  contract.currency = "USD";
```
<p>What did we do? We switched the contract symbol to TSLA, which is Tesla's ticker. We changed securities type from futures to stocks, by changing secType to "STK", and we set the exchange to SMART, which is Interactive Broker's smart router. Lastly, we deleted the contract expiry date since stocks don't have expiry dates.</p>
<p>OK stock jocks, this week's blog is over! Check back next week for more stock or machine learning talk. Which will it be? Maybe both, maybe neither, and maybe it won't be next week!</p>

