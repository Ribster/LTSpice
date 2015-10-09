
                       Frequency Response Analysis

These examples show to how to extract the small-signal, AC open-loop
gain from time-domain, closed-loop simulations.  The technique is a
subset of the method shown in ../LoopGain.asc and ../LoopGain2.asc.
The method assumes that the input impedance of the error amplifier is
infinite so that the loop gain can be computed solely by the voltage
loop gain.

The open-loop gain is computed from the closed-loop system by inserting
a perturbing voltage source in the loop and measuring how well the
perturbation is servoed out of the the loop via the feedback.  The
open-loop gain is given by the ratio of complex voltages at either side
of the perturbing voltage source.

But since the SMPS macromodels are implemented as time-domain models
that include detailed switching information but don't include
continuous-time(average) equivalents, the complex voltage is determined
from Fourier analysis of a time-domain sine wave perturbation.

A script of .measure statements is used to perform the Fourier analysis
and computer the open-loop response.  To use this script into your own
SMPS design, follow these steps:

1.  Place these .measure statements on your circuit as a SPICE
    directive:

     .measure Aavg avg V(a)
     .measure Bavg avg V(b)
     .measure Are avg  (V(a)-Aavg)*cos(360*time*Freq)
     .measure Aim avg -(V(a)-Aavg)*sin(360*time*Freq)
     .measure Bre avg  (V(b)-Bavg)*cos(360*time*Freq)
     .measure Bim avg -(V(b)-Bavg)*sin(360*time*Freq)
     .measure GainMag param 20*log10(hypot(Are,Aim) / hypot(Bre,Bim))
     .measure GainPhi param mod(atan2(Aim,Are)-atan2(Bim,Bre)+180,360)-180

2.  Insert a voltage source in the feedback loop under analysis.  Give
    this voltage sourse the value SINE(0 5m {Freq})

3.  Place a SPICE directive on the schmatic that defines Freq:

     .param Freq=10K
 
4.  Run a .tran command to see how long it takes your circuit to come to
    steady state and then edit the .tran command so that data isn't saved
    until this time.

5.  Rerun the .tran command to do the analysis at the frequency defined
    with the .param statement of step 3.

6.  Execute menu command View=>SPICE Error Log to see the results of this
    analysis.  The open-loop response magnitude is given by GainMag[dB]
    and the phase is given by  GainPhi[°].

You can iterate the param Freq to zero dB.  That frequency is the loop
crossover frequency and phase margin will be reported as GainPhi in the
error log.

You can set up a .step statement to sweep the parameter Freq.  Then you
can plot the open-loop response be executing menu command
View=>SPICE Error Log, and then right mouse clicking and executing menu
command "Plot .step'ed .meas data"  Answer yes to the dialog that asks
if LTspice should combine the real .meas data to complex data.  Then you
can plot the quanity gain to get a Bode plot the open-loop response of
the system.

--Mike