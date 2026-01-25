<style>
	td p {margin: 0px;}
	.soln {margin: 0px 20px; font-size: x-small}
	table {font-size: small;}
</style>

# Advanced (Bayesian) Statistics
**Instructors**: [Lauren Talluto](mailto:lauren.talluto@uibk.ac.at), [Adrienne &Eacute;tard](mailto:etard@iiasa.ac.at)

**Meeting location**:  Praktikumsraum Biologie (5th Floor)


## Course Description

This course will cover the basics of Bayesian statistical methods with applications in ecology. Bayesian methods are a 
powerful set of tools that are increasingly used with complex ecological data. These methods can also be extended quite 
easily beyond conventional analyses to include process-based/mechanistic models. Topics include probability and l
ikelihood, Bayesian software, implementations of various models (e.g., GLMs, hierarchical models) in a Bayesian 
framework, diagnostics, and statistical inference.

## Learning Objectives

* Understand basic concepts from probability theory, and express common statistical models probabilistically
* Apply maximum likelihood and Bayes' Theorem to common statistical problems
* Express symbolically and in code the likelihood and prior probability of a Bayesian model
* Understand and implement methods for estimating models, including optimisers, MCMC samplers, and approximation 
methods, in both R and Stan
* Visualise, evaluate, and understand model output


## Schedule
<table>
	<tr>
		<th> Date </th> <th> Time </th> <th> Topics </th> <th> Lecture Notes </th> <th> Exercises </th>
	</tr>
	<tr>
		<td rowspan = 2>Monday <br/> 02.02.26 </td>
		<td> 9:00-12:00 </td>
		<td>
			<p>Intro, Probability review</p>
			<p>Distributions</p>
		</td>
		<td><a href="lec/1_probability">Probability & Distributions </a><br/>(Lauren)</td>
		<td>
			<p><a href = "ex/ex1_distributions">Distributions in R</a></p>
			<!-- <p class = "soln"><a href = "ex/soln1_distributions.html">Solutions</a></p> -->
		</td>
	</tr>
	<tr>
		<td> 13:00-17:00 </td>
		<td>
			<p>Maximum likelihood</p>
			<p>Optimisation</p>
			<p>Markov-chain Monte Carlo</p>
		</td>
		<td>
			<p><a href="lec/2_mle">Maximum Likelihood Estimation</a> (Adrienne)</p>
			<a href="lec/3_mcmc">MCMC & Sampling</a> (Lauren)
		</td>
		<td>
			<p><a href = "ex/ex2_tree.html">Tree mortality</a></p>
			<!-- <p class = "soln"><a href = "ex/soln2_tree.html">Solutions</a></p> -->
			<p><a href = "ex/ex3_tank">German tank problem</a></p>
		</td>
	</tr>
	<tr>
		<td rowspan = 2> Tuesday <br/> 03.02.26 </td>
		<td> 9:00-12:00 </td>
		<td>
			<p>Inference I: Sampling &amp; hypothesis tests</p>
		</td>
		<td><a href="lec/4_inference_i">Inference I</a><br/>(Lauren)</td>
		<td>
			<p><a href = "ex/ex3_tank">German tank problem</a></p>
			<!-- <p class = "soln"><a href = "ex/soln3_tank.html">Solutions</a></p> -->
			<p class = "ex"><a href = "ex/ex4_birddisp.html">Bird dispersal</a></p>
				<!-- <p class = "soln"><a href = "ex/soln4_birddisp.html">Solutions</a></p> -->
		</td>
	</tr>
	<tr>
		<td> 13:00-17:00 </td>
		<td>
			<p>Generalised linear models</p>
		</td>
		<td>
			<p><a href="lec/5_regression">Regression &amp; GLM</a></p>(Adrienne)
		</td>
		<td>
			<p class = "ex"><a href = "ex/ex5_kung.html">!Kung dataset</a></p>
				<!-- <p class = "soln"><a href = "ex/soln">Solutions</a></p> -->
			<p class = "ex"><a href = "ex/ex6_birddiv_glm.html">Bird diversity</a></p>
		</td>
	</tr>
	<tr>
		<td rowspan = 2> Wednesday <br/> 04.02.26 </td>
		<td> 9:00-12:00 </td>
		<td>
			<p><b>Inference II:</b></p>
				<p class = "soln">Priors & Diagnostics</p>
				<p class = "soln">Bayesian workflow</p>
		</td>
		<td>
			<p><a href="lec/6_inference_ii">Inference II</a></p> (Lauren)
		</td>
		<td><p>Project conception</p>Exercises catch-up</td>
	</tr>
	<tr>
		<td> 13:00-17:00 </td>
		<td></td>
		<td></td>
		<td>Project work</td>
	</tr>
	<tr>
		<td rowspan = 2> Thursday <br/> 05.02.26 </td>
		<td> 9:00-12:00 </td>
		<td><p>Hierarchical &amp; Multilevel Models</p></td>
		<td><p><a href="lec/7_hm">Hierarchical Models</a></p>(Adrienne)</td>
		<td rowspan = 2>Project work</td>
	</tr>
	<tr>
		<td> 13:00-17:00 </td>
		<td>
			<p><b>Inference III:</b></p>
			<p class = "soln">Model selection</p>
			<p class = "soln">Multimodel inference</p>
		</td>
		<td><a href="lec/8_model_selection">Model selection</a><br/>(Lauren)</td>
		<td></td>
	</tr>
	<tr>
		<td rowspan = 2> Friday <br/> 06.02.26 </td>
		<td> 9:00-12:00 </td>
		<td>Advanced Models</td>
		<td>
			<a href="lec/9_advanced_models">Advanced Models</a><br/>(Lauren)
		</td>
		<td rowspan = 2>Project work</td>
	</tr>
	<tr>
		<td> 13:00-17:00 </td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td rowspan = 2> Monday <br/> 09.02.26 </td>
		<td> 9:00-12:00 </td>
		<td>Presentations</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td> 13:00-17:00 </td>
		<td>Q&A, Wrap-up (if needed)</td>
		<td></td>
		<td></td>
	</tr>
</table>

## Exercises
Most lectures will include exercises, which can be completed individually or in groups. We encourage you to work through 
them as much as you can. We will not grade the exercises, and it is not necessary to turn them in, but we are happy to 
provide individual feedback/help as needed. During official meeting times, we will also walk through the exercises 
(as much as time allows) and explain the code to everyone at once.

## Course files
All of the files for the course are on Github. To create a local copy on your computer, you can follow the instructions 
[here](https://github.com/ltalluto/vu_advstats_students).

## Projects
Everyone will complete a data analysis group project using a Bayesian analysis of your choice. I am happy to provide 
feedback to your group as you are developing your project to help steer you toward the proper analysis. Projects will 
be presented on the last day of instruction. Presentations should be roughly 10-15 minutes, and should include a brief 
description of the data and the scientific questions, an explanation of the model structure and why the structure is 
appropriate, other technical details that will help the other groups understand your model, and the status 
(MCMC diagnostics, results, etc). 

Additionally, you should collectively prepare a short write-up of your project, to be submitted by the end of the 
semester. This write up is your chance to practise **concise** writing about statistics. Please include an extended
abstract introducing the topic (including biological details sufficient to understand the problem) and presenting the
study objectives (both in a biological and statistical sense), a methods section that includes a **brief** discussion 
of the dataset and a complete description of your model, and a combined results/discussion section that presents your
model output (especially as related to your study objectives!) and interprets it. It is not necessary to solve a
major biological problem here, but you should be able to draw some **biological** conclusions about your study system
from the output of your model.

These write-ups are due on **28.02.2026**. Please note that this is a hard deadline (so that we can submit final marks)!

## Assessment:

* 40%: Participation in the exercises and group work
* 30%: Group presentation on **09.02.2026**
* 30%: Group project writeup due **28.02.2026**

<p style="font-size: small">*at least 50% is a passing mark*</p>