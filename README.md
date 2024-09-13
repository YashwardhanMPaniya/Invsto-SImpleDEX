### Quickstart

```
Deploy Token A and Token B with 10,000 token each, than transfer 1000 token of both token to SimpleDEX contract and approve it
```

## exchangeTokenAForTokenB 10 Tokens

```

status	0x1 Transaction mined and execution succeed
transaction hash	0xf5d6aa14a6ba56c370f146bc596cd4242fb6cc61353f8726bb8fd0f3d7ea7e3e
block hash	0x06e0b61dd75e2eac3a3274dc590159bc531543862c6325dcf1fa3c0023beae4d
block number	47
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	SimpleDEX.exchangeTokenAForTokenB(uint256) 0x9d83e140330758a8fFD07F8Bd73e86ebcA8a5692
gas	82360 gas
transaction cost	71617 gas 
execution cost	50413 gas 
input	0x349...0000a
output	0x
decoded input	{
	"uint256 amountA": "10"
}
decoded output	{}
logs	[
	{
		"from": "0x9d83e140330758a8fFD07F8Bd73e86ebcA8a5692",
		"topic": "0x3d2365974e1553555caaf8f39f1c92d01d98893b835ffadae06aee77e60768ea",
		"event": "ExchangedTokenAForTokenB",
		"args": {
			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"1": "10",
			"2": "10",
			"user": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"amountA": "10",
			"amountB": "10"
		}
	}
]
```

##exchangeTokenBForTokenA 50 tokens

```
status	0x1 Transaction mined and execution succeed
transaction hash	0xd3922b9c9e7210df83b53d50c8f590e63e414d525a3e140083f90c8b83ce544f
block hash	0xd80ded17659520dbbc83e10f99d26a54e17cafdbb3fa9689d8b6daa60fbfc6ee
block number	48
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	SimpleDEX.exchangeTokenBForTokenA(uint256) 0x9d83e140330758a8fFD07F8Bd73e86ebcA8a5692
gas	82396 gas
transaction cost	71648 gas 
execution cost	50456 gas 
input	0xe4b...00032
output	0x
decoded input	{
	"uint256 amountB": "50"
}
decoded output	{}
logs	[
	{
		"from": "0x9d83e140330758a8fFD07F8Bd73e86ebcA8a5692",
		"topic": "0x5fa2719218f2053e6b155c250cedf89473581044ade40b052b581c03089658a2",
		"event": "ExchangedTokenBForTokenA",
		"args": {
			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"1": "50",
			"2": "50",
			"user": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"amountB": "50",
			"amountA": "50"
		}
	}
]
```

### Images
Token A
![image](https://github.com/user-attachments/assets/e38c4196-b0c2-46c6-89d1-84c024842a44)

Token B
![image](https://github.com/user-attachments/assets/3e355c33-a82b-4dda-a953-e2bf89c8f43a)

SimpleDEX
![image](https://github.com/user-attachments/assets/24de61bd-8261-4520-bcbe-c86921245519)



