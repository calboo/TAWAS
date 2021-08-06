# TAWAS
An idl script for solving the wave equation for torsional Alfven waves in a viscous plasma in static equilibrium with an axisymmetric, force-free magnetic field with no azimuthal component. The solution is calculated using the analytical formula presented in NAMEOFPAPER. 

## Usage

The code can be run simply using IDL. The code requires no inputs but the user is able to change the problem parameters at the top of the code, the parameters are listed in the first table below. The code outputs include solutions for the azimuthal velocity perturbation, the azimuthal magnetic field perturbation and the wave energy across magnetic surfaces that intersect the vertical axis at different heights. The outputs are saved as .sav files and are listed in the second table below.

## Parameters

The parameters that can be changed are at the begining of the code. These parameters are:

| Parameter | Description |
| --- | --- |
| b0     | Background magnetic field strength                               |
| rho0   | Characteristic density                                           |
| rsize  | number of cells in redial direction                              |
| zsize  | number of cells in vertical direction                            |
| rdim   | dimension of domain in the radial direction                      |
| zdim   | dimension of domain in the vertical direction                    |
| H      | magnetic scale height                                            |
| alpha  | &alpha; parameter, defines density scale height through 	&alpha; = H/H<sub>&rho;</sub>    |
| r0     | radius of central higher density tube                            |
| zeta   | density contrast between tube centre and background density      |
| u0     | Alfv&egrave;n wave velocity amplitude in ms<sup>&-1;</sup>       |
| period | wave period in seconds                                           |
| t0     | wave phase of solution as time in seconds (usually left as zero) |


