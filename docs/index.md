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

<!--TODO: change names of the exercises to what they will be
-->

|Date  |Topics       |Lecture Notes |Exercises |
| :--- |  :---   |   :---    | :--- |
|21.11<br/>13:00–16:45 |Intro, Probability review<br/>Distributions                          |[Probability & Distributions](1_probability) |[Distributions in R](exercises/2_distributions_ex.html)
|23.11<br/>13:00–16:45 |Maximum likelihood<br/>Optimisation<br/>Linear Models<br/>Laplace Approximation|Lecture: MLE<br/>Lecture: LM|Exercises: MLE<br/>Exercises: LM|
|25.11<br/>13:15–17:00|Posterior Inference, Sampling<br/>Markov-chain Monte Carlo|Lecture: Inference<br/>Lecture: MCMC|German tank problem|
|28.11<br/>13:15–17:00 |Generalised linear models<br/>Stan Language<br/>Priors, Diagnostics|Lecture: GLM<br/>Lecture: Stan|Exercises: GLM|
|30.11<br/>13:15–17:00 |Hierarchical Models<br/>Exercises/Project work|Lecture: HM|Exercises: HM
|07.12<br/>13:00–16:45|Model selection & comparison<br/>Project work<br/>|Lecture: Model Selection|
|13.12<br/>08:15–12:00|Spatial Models (time permitting)<br/>Wrap-up<br/>Presentations|Spatial Models Part 1<br/>Spatial Models Part 2|

<!--
|23.11<br/>13:00–16:45 |Maximum likelihood<br/>Optimisation<br/>Linear Models<br/>Laplace Approximation|[Lecture: MLE](3_mle)<br/>[Lecture: LM](4_lm_laplace)|[Exercises: MLE](exercises/3_mle_ex.html)<br/>[Solutions: MLE](exercises/3_mle_soln.html)<br/>[Exercises: LM](exercises/4_5_lm_exercises.html)<br/>[Solutions: LM](exercises/4_5_lm_soln.html)|
|25.11<br/>13:15–17:00|Posterior Inference, Sampling<br/>Markov-chain Monte Carlo|[Lecture: Inference](5_posterior_inference)<br/>[Lecture: MCMC](6_mcmc)|[Exercises: MCMC](exercises/6_mcmc_exercises.html)<br/>[Solutions: MCMC](exercises/6_mcmc_soln.html)|
|28.11<br/>13:15–17:00 |Generalised linear models<br/>Stan Language<br/>Priors, Diagnostics|[Lecture: GLM](7_glm)<br/>[Lecture: Stan](8_stan)|[Exercises: GLM](exercises/7_glm_exercises.html)|
|30.11<br/>13:15–17:00 |Hierarchical Models<br/>Exercises/Project work|[Lecture: HM](9_hm)|[Exercises: HM](exercises/9_hm_exercises.html)
|07.12<br/>13:00–16:45|Model selection & comparison<br/>Project work<br/>|[Lecture: Model Selection](10_model_selection)|
|13.12<br/>08:15–12:00|Spatial Models (time permitting)<br/>Wrap-up<br/>Presentations|[Spatial Models Part 1](11_spatial_gp)<br/>[Spatial Models Part 2](12_gp_implementation)|

-->
## Exercises
Most lectures will include exercises, which can be completed individually or in groups. I encourage you to work through them as much as you can. I will not grade the exercises, and it is not necessary to turn them in, but I'm happy to provide individual feedback/help as needed. During official meeting times, I will also walk through the exercises (as much as time allows) and explain the code to everyone at once.

## Projects
Everyone will complete a data analysis group project using a Bayesian analysis of your choice. I am happy to provide feedback to your group as you are developing your project to help steer you toward the proper analysis. Projects will be presented on the last day of instruction. Presentations should be roughly 10-15 minutes, and should include a brief description of the data and the scientific questions, an explanation of the model structure and why the structure is appropriate, other technical details that will help the other groups understand your model, and the status (MCMC diagnostics, results, etc). Additionally, you should collectively prepare a short write-up of your project, to be submitted by the end of the semester. This write up should be more complete than the presentation, with a short introduction, methods section detailing the model structure and why it was chosen, a **brief** description of the dataset and any information needed to understand it, results with figures as appropriate, and a short discussion with some interpretation of your model results.