# Introductory Bayesian Statistics
**Instructor**: Matthew Talluto

**Office**: Technikerstraße 25, Room 506

**Meeting location**:  
All virtual


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
|03.05 |Intro, Probability review<br/>Distributions                          |[Lecture: Probability](1_probability) <br/> [Lecture: Distributions](2_distributions)|[Exercises: Distributions](exercises/2_distributions_ex.html)<p style="font-size: small;	margin-top: 0em;padding-left: 1.5em;">[Solutions](exercises/2_distributions_soln.html)</p>|
|05.05 |Maximum likelihood<br/>Optimisation<br/>Linear Models<br/>Laplace Approximation<br/>Posterior Inference, Sampling|[Lecture: MLE](3_mle)<br/>[Lecture: LM](4_lm_laplace)<br/>[Lecture: Inference](5_posterior_inference)|[Exercises: MLE](exercises/3_mle_ex.html)<br/>[Exercises: LM](exercises/4_5_lm_exercises.html)|
|07.05 |Generalised linear models<br/>Markov-chain Monte Carlo                 |||
|10.05 |Stan Language<br/>Priors, Diagnostics<br/>Project work                              |||
|12.05 |Hierarchical Models<br/>Project work|||
|14.05|Model selection & comparison<br/>Spatial Models<br/>Project work |||
|17.05<br/>(or TBD)|Wrap-up<br/>Presentations|



## Exercises
Most lectures will include exercises, which can be completed individually or in groups. I encourage you to work through them as much as you can, despite our short time frame for the course. I will be on stand-by during the 2 weeks of the course to help with the exercises and provide individual/group-level feedback. We can arrange these as we need them using zoom meetings. During official meeting times, I will also walk through the exercises (as much as time allows) and explain the code to everyone at once.

## Projects
Everyone will complete a data analysis group project using a Bayesian analysis of your choice. I am happy to provide feedback to your group as you are developing your project to help steer you toward the proper analysis. Projects will be presented on the last day of instruction. Presentations should be roughly 10 minutes, and should include a brief description of the data and the scientific questions, an explanation of the model structure and why the structure is appropriate, other technical details that will help the other groups understand your model, and the status (MCMC diagnostics, results, etc). All group members should participate to some extent in the presentations.




