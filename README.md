# covid-project--part3


 
 ### SIR Model
 
The Susceptible-Infected-Recovered/Removed (__SIR__) model is a very basic model in Epidemiology to predict the spread of an infectious disease. The susceptible compartment consists of people who are vulnerable to the disease, and in the case of Covid-19, it is the entire population except those who have gained immunity after recovering. The basic SIR model calculates the rate of susceptibility, rate of infected, rate of removed (recovered + dead) by considering the solution of the function where Y<sub>t</sub><sup>I</sup> and Y<sub>t</sub><sup>R</sup> (proportions of infected and removed state at time t) follows a Beta-Dirichlet state-space model (BDSSM). A fourth-order approximation is then applied to the solution. The differential equations governing the model are:

<img src="https://github.com/Nitin1901/Indian-eSIR-model/blob/master/Assets/SIR_model.png" height=200>
<img src="https://github.com/Nitin1901/Indian-eSIR-model/blob/master/Assets/SIR_eq_1.png" height=400>
<img src="https://github.com/Nitin1901/Indian-eSIR-model/blob/master/Assets/SIR_model_soln.png" height=300>
<img src="https://github.com/Nitin1901/Indian-eSIR-model/blob/master/Assets/priors.png" height=100>

*Source of images: [eSIR GitHub](https://github.com/lilywang1988/eSIR)*

The drawback of the SIR model is that it considers a constant transmission rate β throughout the course of the epidemic and does not consider any adopted individual or government measures.

Our aim is to reduce the transmission rate β or increase the recovery rate γ. As the recovery rate depends on the arrival of the vaccine and the immunity power, we intend to reduce the transmission rate to as low as possible such that the ratio β/γ is less than one. (i.e., the recovery rate is larger than the transmission rate.) This ratio is denoted by R<sub>0</sub> called the Basic Reproductive Number. This ratio is dynamic and can change w.r.t the measures and social distancing being followed. 

The real-time function denoted by R<sub>t</sub>(Effective Reproductive Number), defined as the average number of secondary infections produced by an infected individual when transmission occurs in a population that is not entirely susceptible due to implemented control measures is calculated by a method which requires only the daily number of observed reported cases and the distribution of Serial Interval. (The time between successive cases in a chain of transmission.) This real-time ratio helps us in deciding future severity and possible steps to reduce fatalities.

