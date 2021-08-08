# neural-network-fpga

## Description

This project propose an alternative implementation of Perceptron Multilayer Neural Networks to solve binary classification problem in FPGAs devices.

## Advices

There are some important observations you may know before using this work:
- This Network is based on fixed point Q4.12 instead float point (you can adapt)
- The layers are on 7-6-1 configuration (you may adapt as your need in ``network_pkg.vhd`` file)
- The input is configured to receive 2 values (you may adapt as your need in ``network_pkg.vhd`` file)
- The first and second layers are using the relu as activation function
- The last layer is using and adaptation of logistic sigmoid function
- The weights and biases are not trained here, you must to add the values in ``weights.txt`` and ``biases.txt`` 
- Values in ``weights.txt`` and ``biases.txt`` must be following the order from first neuron of first layer to last neuron of last layer
- Is recommended some framework as TensorFlow to calculate the weights and biases
- Is recommended some script to convert the calculated weights and biases to fixed point and write the files


## Example

I already added a trained network as propose to solve the classification problem below:

![image](https://telegra.ph/file/13d2ef64d4419781c6b6c.png)
