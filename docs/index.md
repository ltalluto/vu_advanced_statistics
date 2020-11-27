# Advanced Statistics
**Instructor**: Matthew Talluto

**Office**: Technikerstraße 25, Room 506

**Meeting location**:  
Lectures: virtual  
Practicals: RR 26 (if possible, otherwise virtual)


## Course Description

This course will cover the basics of Bayesian statistical methods with applications in ecology. Bayesian methods are a powerful set of tools that are increasingly used with complex ecological data. These methods can also be extended quite easily beyond conventional analyses to include process-based/mechanistic models. Topics include probability and likelihood, Bayesian software, implementations of various models (e.g., GLMs, hierarchical models) in a Bayesian framework, diagnostics, and statistical inference.

## Learning Objectives

* Understand basic concepts from probability theory, and express common statistical models probabilistically
* Apply maximum likelihood and Bayes' Theorem to common statistical problems
* Express symbolically and in code the likelihood and prior probability of a Bayesian model
* Understand and implement methods for estimating models, including optimisers, MCMC samplers, and approximation methods, in both R and Stan
* Visualise, evaluate, and understand model output


## Schedule

|Dates       |Topics                                                    |Tuesday    |Thursday |
| :---       |  :---                                                    |   :---    |:---     |
|29.10       |Intro, Probability review                                 |           |[Lecture notes](1_probability)|
|03.11, 05.11|Distributions, Maximum likelihood<br/>Optimisation        |[Lecture Notes](2_distributions)<br/>[Exercises](exercises/2_distributions_ex.html)<br/>[Solutions](exercises/2_distributions_soln.html)|[Lecture Notes](3_mle)<br/>[Exercises](exercises/3_mle_ex.html)<br/>[Solutions](exercises/3_mle_soln.html)|
|10.11, 12.11|Linear Models, Laplace Approximation<br/>Posterior Inference, Sampling |[Lecture Notes](4_lm_laplace)<br/> [Exercises](exercises/4_5_lm_exercises.html)<br/>[Solutions](exercises/4_5_lm_soln.html)|[Lecture Notes](5_posterior_inference)|
|17.11, 19.11|Generalised linear models<br/>Markov-chain Monte Carlo   |[Lecture Notes](6_mcmc)<br/>[Exercises](exercises/6_mcmc_exercises.html)<br/>[Solutions](exercises/6_mcmc_soln.html)|[Lecture Notes](7_glm)<br/>[Exercises](exercises/7_glm_exercises.html)<br/>[Solutions](exercises/8_stan.html#(16))|
|24.11, 26.11|Stan Language, Priors, Diagnostics<br/>|[Lecture Notes](8_stan)    | (Project work only)|
|01.12, 03.12|Hierarchical Models<br/>Model selection, comparison        |Lecture/Practice    |Lecture/Practice|
|08.12, 10.12|Finite mixtures                                            |**Holiday**|Lecture/Practice  |
|15.12, 17.12|Spatial Models                                            |Lecture/Practice  |Lecture/Practice |
|TBD (January)|**Presentations**|
|02.02.21|**Project reports due**|


## Exercises
Most lectures will include exercises, which can be completed individually or in groups. Exercises will not be graded, but feedback will be given and completing them will count as course participation. You can submit exercises for feedback by email for up to one week after the practical sessions. You do not need to submit them if you don't want feedback, but you *do* need to to do them. If you work in groups, please send a single file with all of your names. 

## Projects
Everyone will complete a data analysis group project using a Bayesian analysis of your choice. I am happy to provide feedback to your group as you are developing your project to help steer you toward the proper analysis. Projects will be presented (virtually, unless COVID restrictions change greatly) on the last day of instruction, 17 December. Presentations should be roughly 10 minutes, and should include a brief description of the data and the scientific questions, an explanation of the model structure and why the structure is appropriate, other technical details that will help the group understand your model, and the status (MCMC diagnostics, preliminary results, etc). All group members should participate to some extent in the presentations.

In addition to the *group* presentations, everyone should submit an *individual* written project report no later than the last day of the semester (02.02.21). These should be short (similar to a short-format report found in *Nature*, *Science*, etc.). These should be focused more on the scientific aspects of the project, including any introduction needed, a brief presentation of the results, max 2 paragraphs of discussion, and a detailed methods section. The methods need not present the details behind the data collection, but should give all the relevant details from your modelling exercise. Figures should include both diagnostics as well as results. Note that, although these are individual writeups, it is expected that you will consult with the owner of the dataset you used for information for the introduction and methods.

## Assessment
* Participation: 20% (completing practicals, participating in discsussions, etc)
* Project presentation: 40%
* Project writeup: 40%



