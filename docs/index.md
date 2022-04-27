# Advanced (Bayesian) Statistics
**Instructor**: Matthew Talluto

**Office**: Technikerstraße 25, Room 506

**Meeting location**:  Seminarraum Biologie


## Course Description

This course will cover the basics of Bayesian statistical methods with applications in ecology. Bayesian methods are a powerful set of tools that are increasingly used with complex ecological data. These methods can also be extended quite easily beyond conventional analyses to include process-based/mechanistic models. Topics include probability and likelihood, Bayesian software, implementations of various models (e.g., GLMs, hierarchical models) in a Bayesian framework, diagnostics, and statistical inference.

## Learning Objectives

* Understand basic concepts from probability theory, and express common statistical models probabilistically
* Apply maximum likelihood and Bayes' Theorem to common statistical problems
* Express symbolically and in code the likelihood and prior probability of a Bayesian model
* Understand and implement methods for estimating models, including optimisers, MCMC samplers, and approximation methods, in both R and Stan
* Visualise, evaluate, and understand model output


## Schedule

|Date  |Topics                                                    |Lecture Notes |Exercises |
| :--- |  :---                                                                 |   :---    | :--- |
|02.05<br/>Morning |Intro, Probability review<br/>Distributions                          |[Lecture: Probability](1_probability) <br/> [Lecture: Distributions](2_distributions)|[Exercises: Distributions](exercises/2_distributions_ex.html)<br/>[Solutions: Distributions](exercises/2_distributions_soln.html)
|02.05<br/>Afternoon |Maximum likelihood<br/>Optimisation|[Lecture: MLE](3_mle)<br/>|[Exercises: MLE](exercises/3_mle_ex.html)<br/>[Solutions: MLE](exercises/3_mle_soln.html)|
|03.05<br/>Afternoon|Linear Models<br/>Laplace Approximation<br/>Posterior Inference, Sampling|[Lecture: LM](4_lm_laplace)<br/>[Lecture: Inference](5_posterior_inference)|[Exercises: LM](exercises/4_5_lm_exercises.html)<br/>[Solutions: LM](exercises/4_5_lm_soln.html)|
|04.05<br/>Morning |Markov-chain Monte Carlo|[Lecture: MCMC](6_mcmc)|[Exercises: MCMC](exercises/6_mcmc_exercises.html)<br/>[Solutions: MCMC](exercises/6_mcmc_soln.html)|
|04.05<br/>Afternoon |Generalised linear models<br/>|[Lecture: GLM](7_glm)<br/>|[Exercises: GLM](exercises/7_glm_exercises.html)|
|05.05<br/>Afternoon|Stan Language<br/>Priors, Diagnostics<br/> Exercises/Project work|[Lecture: Stan](8_stan)|
|06.05<br/>Morning|Hierarchical Models<br/>Project work|[Lecture: HM](9_hm)|[Exercises: HM](exercises/9_hm_exercises.html)
|06.05<br/>Afternoon|Model selection & comparison<br/>Project work<br/>Spatial Models <br/>(time permitting)|[Lecture: Model Selection](10_model_selection)<br/>[Spatial Models Part 1](11_spatial_gp)<br/>[Spatial Models Part 2](12_gp_implementation)||
|11.05<br/>Afternoon|Wrap-up<br/>Presentations|



## Exercises
Most lectures will include exercises, which can be completed individually or in groups. I encourage you to work through them as much as you can. I will not grade the exercises, and it is not necessary to turn them in, but I'm happy to provide individual feedback/help as needed. During official meeting times, I will also walk through the exercises (as much as time allows) and explain the code to everyone at once.

## Projects
Everyone will complete a data analysis group project using a Bayesian analysis of your choice. I am happy to provide feedback to your group as you are developing your project to help steer you toward the proper analysis. Projects will be presented on the last day of instruction. Presentations should be roughly 10-15 minutes, and should include a brief description of the data and the scientific questions, an explanation of the model structure and why the structure is appropriate, other technical details that will help the other groups understand your model, and the status (MCMC diagnostics, results, etc). Additionally, you should collectively prepare a short write-up of your project, to be submitted by the end of the semester. This write up should be more complete than the presentation, with a short introduction, methods section detailing the model structure and why it was chosen, a **brief** description of the dataset and any information needed to understand it, results with figures as appropriate, and a short discussion with some interpretation of your model results.