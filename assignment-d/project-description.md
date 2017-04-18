B-MU225 / PRINCIPAL STUDY 2B (EM) / AY1617

# Assignment D

Lee Kai Yin, Kaylyn (18032)

Blog: https://www.tumblr.com/blog/processingwkay

Video Title: "Breathe" by Kaylyn Lee

Soundtrack: "Breathe" by Kaylyn Lee

# Project Description

"Breathe" visuals is inspired by an exhibition named "Story of the Forest" at National Gallery of Singapore. The exhibition aims to explore the intriguing relationship between man and nature. The exhibition was filled with drawing visuals of nature elements. Part of the exhibition featured like a star-gazing concept which allows visitors to seat or lie on the ground filled with bean bags to appreciate the 360 degree room filled with entire visuals. I was inspired by the concept of nature and night time feeling of star-gazing. I would like to create a minimalist feel for the sketch

The soundtrack created is an ambient and mellow melodic piece composed by myself. My objective of this video and soundtrack was to give hope and light to anybody who feels lonely or despair and provide them a sense of comfort that nobody is alone, everyone will eventually find someone who support and love them. Life is always ups and down, may this give strength and encouragement to everyone to continue to breathe and grow for the one they love just like nature/plants, as it is the most genuine reason to strive for in life.

# References

My sketches mainly is being influences Mikkel Koser’s COP15 Identity (http://www.okdeluxe.co.uk/cop15/) and Reinoud van Laar’s Fluid Leaves/Leaves Pattern (http://reinoudvanlaar.nl/project/leavespattern/).

Mikkel Koser shows how he manipulates the ControlP5 which allows the sketch to be controlled using ControlP5 for live performance to evolve the algorithmic lines from simplexity to complexity. The visuals are also audio interactive which changes according to the mood or tension of the music piece. Reinoud van Laar's Fluid Leaves/Leaves Pattern made use of libraries such as ControlP5 and Geomerative. What I enjoy particularly is the random replica of geometric patterns which also incorporate noise. He manipulates the initial simple geometric patterns (organic waveforms) transforms into different random algorithm forms and elements (noise waveforms).

The above references/exhibition inspire me to work in the direction visually.

# How does it Work? (Process/Elements used)

One of the sketch used in my video is a refining of my initial sketch "Flowers,Plants,Leaves" earlier for assignment C. The code was also reference from Michael Pinn (OpenProcessing). I replicate it using Beat detective(audio reactive), the code started simple and I make it more complexity by making the sketch looks more variation on the flowers, shapes, lighting, patterns, colors etc. The mouse clicks and key button'1' changes the range of patterns throughout the video. The sketch is mainly geometric.

The second sketch which is more fluid which consists of noise fluids. The code was reference from Zufall und Rauschen (Generative Gestaltung). I manage to replicate elements such as ControlP5 sliders and buttons as a performative element control on the screen to create more complexity and randomize fluid waveforms on the sketch. ControlP5 elements were mainly noiseStrength, noiseScale, overlayAlpha (longer trails) and randomize (fluid pattern effects). I mange to control the sketch live while recording it into Syphon, which is easily controllable and fun to manupulate around with. Also used Minim to generate beat detection to be in sync with the soundtrack to create some intensity in both sketches. In which, this creates audio-reactive lines which are brighter ('blink') or thicker lines. The sketch is algorithmic in nature.

The main difficulty of the sketch is to not show ControlP5 into Syphon, but appears in Processing and record while performing with CP5. Initially, I put in place setAutoDraw(); and cp5.draw() after the end of syphon recording code. However, it doesnt work because the framebuffer never get cleared, heance the image sitll controls the image inside. Tried many processing forum, most did the steps above but it doesnt work on my sketch (refer to archive for reference pictures). Hence, would have to add buffer.() to anything inside void draw(). In order for PGraphics and Controllers so they would not be rendered into the frame, thus, this is the only soulution to this problem.

Pleased and satisfied with my minimalist nature concept sketches. 

Thank you Lecturer Andy for his guidance and patience throughout the semester.

# Categories:

A: algorithmic, geometric

B:audio reactive/beat reactive

C:ControlP5,Syphon

D:calm and changes to frantic and revert back to calm