When I deliver seminars, I usually travel with
a sound system instead of relying on renting
one from the conference facility.  I carried a
mixer console, power amp and speaker in one
wheeled piece of luggage.  There was a rack-
mounted wireless mic system in another rolling
bag.  I daintily carried the microphone, the
same model as Britney Spears uses, in my pocket
because it was expensive and didn't want it
banged up by all the heavy sound gear I was
dragging along.  Navigating unfamiliar airports
solo with a two rolling pieces of luggage and
a heavy brief case around my neck is difficult.

So I decided to make my own PA system.  First of
all I really didn't need a wireless mic. Handsfree
is the right paradigm.  HandsFreePreamp.asc is the
schematic of a microphone that works well with the
electret mics that are intended for handsfree cell
phone operation.  Basing the system on such a mic
also meant that I could replace the most important
part of the system from a roadside convenience
store if required.  The points to the design are
(i) a higher-valued resistor is used for reading
out the mic current(10K instead of 2K as is more
common).  This gives this preamp an edge in S/N
because the signal grows like the resistance but
the noise goes like the square root of the
resistance.  (ii) The FET input gives low noise at
this high impedance and (iii) even though it's
class A, feedback is used to reduce distortion and
reduce the output impedance.  The larger than
normal-valued output capacitor that you see is
used to short the cable to this low impedance.

PowerAmp.asc is the schematic of the power amp
I use.  The idea behind the design is to have
a bullet-proof circuit that runs off of the same
voltage as my notebook power brick.  That gave
me international power capability and a spare
notebook supply, which is also replaceable at
most field conference sites.  I used discreet
components over IC's because they were more
available, better documented, and more forgiving
of the input voltage range of my notebook
powerbrick, than the automotive power amp IC's
that first caught my attention.

The circuits where build on plated-through hole
perfboard.  The layout is shown in
HandsFreeLayout.asc and PowerAmpLayout.asc.

For speakers, I was planning on being able to
use a 5 1/2" woofer from my un-used home
theater center speaker.  But that "woofer" made
voice sound like a public address from the movie
M.A.S.H.  So, instead I used a pair of 4 Ohm car
audio speakers in series.  This worked out well
because (i) they are thin(to mount in car door
panels) and (ii) have polypropylene cones to
handle adverse environments, like the frozen
luggage compartments of commercial aviation.
The box was vented with a 1/4-20 nut that serves
as a tripod mount and equalized the sealed speaker
cabinet for the air pressure changes of flight.
 
Now I have a PA system that fits in a suit case.
I guess my next project should be a compact
teleprompter.

--Mike