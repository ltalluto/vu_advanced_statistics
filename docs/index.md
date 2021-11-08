# Advanced (Bayesian) Statistics
**Instructor**: Matthew Talluto

**Office**: Technikerstraße 25, Room 506

**Meeting location**:  RR 25


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
|28.10 |Intro, Probability review<br/>Distributions                          |[Lecture: Probability](1_probability) <br/> [Lecture: Distributions](2_distributions)||
|03.11|Distributions exercises||[Exercises: Distributions](exercises/2_distributions_ex.html)<br/>[Solutions: Distributions](exercises/2_distributions_soln.html)
|04.11 |Maximum likelihood<br/>Optimisation|[Lecture: MLE](3_mle)<br/>|[Exercises: MLE](exercises/3_mle_ex.html)<br/>[Solutions: MLE](exercises/3_mle_soln.html)|
|09.11|Linear Models<br/>Laplace Approximation<br/>Posterior Inference, Sampling|[Lecture: LM](4_lm_laplace)<br/>[Lecture: Inference](5_posterior_inference)|[Exercises: LM](exercises/4_5_lm_exercises.html)<!---<br/>[Solutions: LM](exercises/4_5_lm_soln.html)-->|
|11.11 |Markov-chain Monte Carlo|[Lecture: MCMC](6_mcmc)|[Exercises: MCMC](exercises/6_mcmc_exercises.html)<!---<br/>[Solutions: MCMC](exercises/6_mcmc_soln.html)-->|
|16.11|Markov-chain Monte Carlo||
|18.11 |Generalised linear models<br/>Stan Language|Lecture: GLM<br/>Lecture: Stan<!--[Lecture: GLM](7_glm)<br/>[Lecture: Stan](8_stan)-->|Exercises: GLM<!--[Exercises: GLM](exercises/7_glm_exercises.html)-->|
|23.11|Priors, Diagnostics<br/> Exercises/Project work  
|25.11 |Hierarchical Models|Lecture: HM<!--[Lecture: HM](9_hm)-->|Exercises: HM<!--Exercises: HM](exercises/9_hm_exercises.html)-->|
|30.11|Exercises/Project work|
|02.12|Model selection & comparison<br/>Project work|Lecture: Model Selection<!--[Lecture: Model Selection](10_model_selection)-->||
|07.12|Spatial Models<br/>(or other special topic)<br/>Project work|<!--[Lecture: Spatial Models Part 1](11_spatial_gp)<br/>[Lecture: Spatial Models Part 2](12_gp_implementation)-->
|14.12|Project work|
|16.12|Wrap-up<br/>Presentations|



## Exercises
Most lectures will include exercises, which can be completed individually or in groups. I encourage you to work through them as much as you can. I will not grade the exercises, and it is not necessary to turn them in, but I'm happy to provide individual feedback/help as needed. During official meeting times, I will also walk through the exercises (as much as time allows) and explain the code to everyone at once.

## Projects
Everyone will complete a data analysis group project using a Bayesian analysis of your choice. I am happy to provide feedback to your group as you are developing your project to help steer you toward the proper analysis. Projects will be presented on the last day of instruction. Presentations should be roughly 10-15 minutes, and should include a brief description of the data and the scientific questions, an explanation of the model structure and why the structure is appropriate, other technical details that will help the other groups understand your model, and the status (MCMC diagnostics, results, etc). Additionally, you should collectively prepare a short write-up of your project, to be submitted by the end of the semester. This write up should be more complete than the presentation, with a short introduction, methods section detailing the model structure and why it was chosen, a **brief** description of the dataset and any information needed to understand it, results with figures as appropriate, and a short discussion with some interpretation of your model results.