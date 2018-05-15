# AIUT3D
---
AI Lab RoboCup 3D simulation team base code release (2016)

### About: 
This release is based off the AI Lab of Isfahan University of Technology RoboCup 3D simulation league team.

### Some Change
1-change the strategy
2-improve goalier motions  

### Requirements:
* simspark and rcssserver3d
* Boost library
* Threads library

Instructions for installing simspark and rcssserver3d:
http://simspark.sourceforge.net/wiki/index.php/Installation_on_Linux

It's optional (recommended) to install the roboviz monitor:
https://github.com/magmaOffenburg/RoboViz


### To build:
```bash
cmake . 
```
 (If cmake can't find RCSSNET3D set the SPARK_DIR environmental variable to the path where you installed the server and then rerun cmake.  Also, if you installed rcssserver3d from a package instead of building it from source, you might need to install the rcssserver3d-dev package.)
 
```bash
make
```

### Instructions for running agent:
Run full team:
```bash
./start.sh <host>
```
Run penalty kick shooter:
```bash
./start_penalty_kicker.sh <host>
```
Run penalty kick goalie:
```bash
./start_penalty_goalie.sh <host>
```
Run agent for Gazebo RoboCup 3D simulation plugin:
```bash
./start_gazebo.sh <host>
```
&nbsp;

Kill team:
```bash
./kill.sh
```
List command line options:
```bash
./agentspark --help
```

### Documentation:
See *Toturial* folder and *AIUT_documentation* for some high level documentation about the codebase.


##### Base Code
Patrick MacAlpine and Peter Stone. 
UT Austin Villa RoboCup 3D Simulation Base Code. 
In Sven Behnke, Daniel D. Lee, Sanem Sariel, and Raymond Sheh, editors, RoboCup 2016: Robot Soccer World Cup XX, Lecture Notes in Artificial Intelligence, Springer Verlag, Berlin, 2016.
(http://www.cs.utexas.edu/~pstone/Papers/bib2html/b2hd-LNAI16-MacAlpine2.html)


### AIUT3D team contacts:

- Navid Hossini Izadi
- Mohamad Roshanzamir
- Mehdi Tajmir Riahi
- Mehdi Abassi Soureshjani
- Seyed Yaghoob Ashkoofaraz
- Dr. Maziar Palhang (Team Leader)


