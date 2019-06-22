
# MIPS Single Cycle Processor ![CI status](https://img.shields.io/badge/build-passing-brightgreen.svg)

This project is a single-cycle MIPS processor developed for the course *Computer Architecture and Organization* at Universidade Federal de São Paulo (UNIFESP)

It's basic usage is the same of a MIPS processor, but it has been modified to run a set of instructions designed specificaly for this version and to support basic I/O operations. Many modifications were made to ensure that a basic operational system could be run using it's native set of instructions.

In short, this processor was designed to support a hand made C- compiler and a operational system writen in C-. Both compiler and OS are part of another project not yet in my github, but I'll upload them soon. 

## Installation

### Requirements
* Quartus ( Any version )
* Altera FPGA with Cyclone IV ( Optional )

## Usage

The main project files are:

- ProcessadorFX.qpf
- ProcessadorFX.qsf

File *Processador.qpf* is the project file, wich is used to open the project in Quartus.  
File *Processador.qsf* contains all pin mapping for Altera DE2-115 FPGA board.  

To run this project:

- Open your Quartus versiion;
- Click on "open project";
- Select "Processador.qpf" as your project file;

Tests can be made using Quartus *waveforms* or using a FPGA board as described.

## Specifications


To run any program using this processor, it is required to use a specific compiler to generate the desired binary code. This compiler is part of another project that will be uploaded to github soon.

Because this processor is designed to support an operating system, it has modules such as a BIOS and a Hard Disk using simulated memory from the FPGA.

The BIOS initializes the system, making integrity checks with I / O and copying the operational system from the HD to the instruction memory. Once this process is done, the user is presented with the OS interface at the LCD display.

This project already comes with the BIOS program and the OS in it's hard drive for testing.

## Contributing
This is a work in progress, some files and descriptions are in need of an update and other components are not in English, requiring aditional updates aswel.

Fell free to fork this project and make pull requests too. 
