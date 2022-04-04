# Solidity CNN Simulator

Convolutional Neural Network (CNN) cost simulation written in solidity

# Hyper-params

* `K`: Number of filters (2^n)
* `F`: Spatial extent
* `S`: The stride
* `P`: The amount of zero padding

## Common Settings

* `K`: 32, 64, 128, 512
* `(F, S, P)`: `(3, 1, 1)`, `(5, 1, 2)`, `(5, 2, *)`, `(1, 1, 0)`

# For Example

* `conv(16, 16, 3, 4, 1, 1, 0)`: 427354 gas
* `pool(16, 16, 3, 1, 1)`: 228546 gas
* `relu(16, 16, 3)`: 102087 gas

## Total

```
427354 + 228546 + 102087 = 757987 [gas]
```

| Outcome	| |
|---------|-|
| % of last 200 blocks accepting this gas price	| 74.5901639344| 
| Transactions At or Above in Current Txpool | 215 |
| Mean Time to Confirm (Blocks)	| 5.1 |
| Mean Time to Confirm (Seconds) | 76 |
| Transaction fee (ETH)	| 0.0227396 |
| Transaction fee (Fiat) | $71.10673 |

*Calculated by [ETH GAS STATION](https://legacy.ethgasstation.info/calculatorTxV.php)* 

* (Apr 4, 2022) Average gas cost (30 gwei)
