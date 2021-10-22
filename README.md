# covid Project-Final Part
Herd immunity occurs when a large portion of a community (the herd) becomes immune to a disease, making the spread of disease from person to person unlikely. As a result, the whole community becomes protected — not just those who are immune.
There are two main paths to herd immunity for COVID-19 — infection and vaccines.

### Natural infection
Herd immunity can be reached when enough people in the population have recovered from a disease and have developed protective antibodies against future infection.
However, there are some major problems with relying on community infection to create herd immunity to the virus that causes COVID-19:
##### Reinfection 
It’s not clear how long you are protected from getting sick again after recovering from COVID-19. Even if you have antibodies, you could get COVID-19 again.
##### Health impact
Experts estimate that in the U.S., 70% of the population — more than 200 million people — would have to recover from COVID-19 to halt the pandemic. This number of infections could lead to serious complications and millions of deaths, especially among older people and those who have existing health conditions. The health care system could quickly become overwhelmed.
### Vaccines
Herd immunity also can be reached when enough people have been vaccinated against a disease and have developed protective antibodies against future infection. Unlike the natural infection method, vaccines create immunity without causing illness or resulting complications. Using the concept of herd immunity, vaccines have successfully controlled contagious diseases such as smallpox, polio, diphtheria, rubella and many others.

Vaccines train our immune systems to create proteins that fight disease, known as ‘antibodies’, just as would happen when we are exposed to a disease but – crucially – vaccines work without making us sick. Vaccinated people are protected from getting the disease in question and passing on the pathogen, breaking any chains of transmission.
                To safely achieve herd immunity against COVID-19, a substantial proportion of a population would need to be vaccinated, lowering the overall amount of virus able to spread in the whole population. One of the aims with working towards herd immunity is to keep vulnerable groups who cannot get vaccinated (e.g. due to health conditions like allergic reactions to the vaccine) safe and protected from the disease. 
                The percentage of people who need to be immune in order to achieve herd immunity varies with each disease. For example, herd immunity against measles requires about 95% of a population to be vaccinated. The remaining 5% will be protected by the fact that measles will not spread among those who are vaccinated. For polio, the threshold is about 80%. 
                The proportion of the population that must be vaccinated against COVID-19 to begin inducing herd immunity is not known. This is an important area of research and will likely vary according to the community, the vaccine, the populations prioritized for vaccination, and other factors.
             
 
 Mathematical models can project how infectious diseases progress to show the likely outcome of an epidemic and help inform public health interventions. Models use basic assumptions or collected statistics along with mathematics to find parameters for various infectious diseases and use those parameters to calculate the effects of different interventions, like mass vaccination programmes. The modelling can help decide which intervention(s) to avoid and which to trial, or can predict future growth patterns, etc. The SIR model is One of them.  
 In order to attain herd immunity, here I have considered the SIR model with dynamic changes in vaccination rate  
 ### SIR Model
 
The Susceptible-Infected-Recovered/Removed (__SIR__) model is a very basic model in Epidemiology to predict the spread of an infectious disease. The susceptible compartment consists of people who are vulnerable to the disease, and in the case of Covid-19, it is the entire population except those who have gained immunity after recovering. The basic SIR model calculates the rate of susceptibility, rate of infected, rate of removed (recovered + dead) by considering the solution of the function where Y<sub>t</sub><sup>I</sup> and Y<sub>t</sub><sup>R</sup> (proportions of infected and removed state at time t) follows a Beta-Dirichlet state-space model (BDSSM). A fourth-order approximation is then applied to the solution. The differential equations governing the model are:

<img src="https://github.com/Nitin1901/Indian-eSIR-model/blob/master/Assets/SIR_model.png" height=200>
<img src="https://github.com/Nitin1901/Indian-eSIR-model/blob/master/Assets/SIR_eq_1.png" height=400>
<img src="https://github.com/Nitin1901/Indian-eSIR-model/blob/master/Assets/SIR_model_soln.png" height=300>
<img src="https://github.com/Nitin1901/Indian-eSIR-model/blob/master/Assets/priors.png" height=100>

*Source of images: [eSIR GitHub](https://github.com/lilywang1988/eSIR)*

The drawback of the SIR model is that it considers a constant transmission rate β throughout the course of the epidemic and does not consider any adopted individual or government measures.

In SIR model, Our aim is to reduce the transmission rate β or increase the recovery rate γ. As the recovery rate depends on the arrival of the vaccine and the immunity power, we intend to reduce the transmission rate to as low as possible such that the ratio β/γ is less than one. (i.e., the recovery rate is larger than the transmission rate.) This ratio is denoted by R<sub>0</sub> called the Basic Reproductive Number. This ratio is dynamic and can change w.r.t the measures and social distancing being followed. 

The real-time function denoted by R<sub>t</sub>(Effective Reproductive Number), defined as the average number of secondary infections produced by an infected individual when transmission occurs in a population that is not entirely susceptible due to implemented control measures is calculated by a method which requires only the daily number of observed reported cases and the distribution of Serial Interval. (The time between successive cases in a chain of transmission.) This real-time ratio helps us in deciding future severity and possible steps to reduce fatalities.


