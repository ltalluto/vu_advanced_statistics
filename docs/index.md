# Advanced (Bayesian) Statistics
**Instructor**: M. Talluto

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

|Date  |Topics       |Lecture Notes |Exercises |
| :--- |  :---   |   :---    | :--- |
|**Tuesday** 21.11<br/>14:15–18:00 |Intro, Probability review<br/>Distributions                          |[Probability & Distributions](1_probability) |[Distributions in R](exercises/1_distributions_ex)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<sup>• [Solutions](exercises/1_distributions_soln)</sup>
|**Friday** 24.11<br/>14:15–18:00 |Maximum likelihood<br/>Optimisation<br/>Linear Models<br/>Laplace Approximation|[Maximum Likelihood Estimation](2_mle)<br/>[Linear Models](3_lm)|[Tree Mortality I](exercises/2_mle_ex.html)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<sup>• [Solutions](exercises/2_mle_soln)</sup><br/>[!Kung height](exercises/3_lm_ex.html)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<sup>• [Solutions](exercises/3_lm_soln)</sup>|
|**Monday** 27.11<br/>8:15–12:00|Posterior Inference, Sampling<br/>Markov-chain Monte Carlo|[Sampling](4_sampling)<br/>[MCMC](5_mcmc)|[German tank problem](exercises/5_mcmc_ex)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<sup>• [Solutions](exercises/5_mcmc_soln)</sup>|
|**Wednesday** 28.11<br/>8:15–12:00 |Generalised linear models<br/>Stan Language<br/>Priors, Diagnostics|[GLMs & Stan](6_stan_glm)|[Bird Species Richness](exercises/6_glm_ex)|
|**Friday** 01.12<br/>8:15–12:00 | Catch-up day
|**Monday** 04.12<br/>13:15–17:00|Hierarchical Models<br/>Exercises/Project work|[Hierarchical Models](7_hm)|[Climate/Tree Mortality](exercises/7_hm_ex)
|**Monday** 11.12<br/>13:15–17:00|Model selection & comparison<br/>Wrap-up<br/>**Presentations**|[Model Selection](8_model_selection)|


## Exercises
Most lectures will include exercises, which can be completed individually or in groups. I encourage you to work through them as much as you can. I will not grade the exercises, and it is not necessary to turn them in, but I'm happy to provide individual feedback/help as needed. During official meeting times, I will also walk through the exercises (as much as time allows) and explain the code to everyone at once.

## Projects
Everyone will complete a data analysis group project using a Bayesian analysis of your choice. I am happy to provide feedback to your group as you are developing your project to help steer you toward the proper analysis. Projects will be presented on the last day of instruction. Presentations should be roughly 10-15 minutes, and should include a brief description of the data and the scientific questions, an explanation of the model structure and why the structure is appropriate, other technical details that will help the other groups understand your model, and the status (MCMC diagnostics, results, etc). Additionally, you should collectively prepare a short write-up of your project, to be submitted by the end of the semester. This write up should be more complete than the presentation, with a short introduction, methods section detailing the model structure and why it was chosen, a **brief** description of the dataset and any information needed to understand it, results with figures as appropriate, and a short discussion with some interpretation of your model results.

These write-ups are due on **28.02.2024**