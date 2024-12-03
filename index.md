<style>
	td p {margin: 0px;}
	.soln {margin: 0px 20px; font-size: x-small}
	table {font-size: small;}
</style>

# Advanced (Bayesian) Statistics
**Instructor**: Lauren Talluto

**Office**: Technikerstraße 25, Room 506

**Meeting location**:  Seminarraum Biologie (except for 11.12)


## Course Description

This course will cover the basics of Bayesian statistical methods with applications in ecology. Bayesian methods are a powerful set of tools that are increasingly used with complex ecological data. These methods can also be extended quite easily beyond conventional analyses to include process-based/mechanistic models. Topics include probability and likelihood, Bayesian software, implementations of various models (e.g., GLMs, hierarchical models) in a Bayesian framework, diagnostics, and statistical inference.

## Learning Objectives

* Understand basic concepts from probability theory, and express common statistical models probabilistically
* Apply maximum likelihood and Bayes' Theorem to common statistical problems
* Express symbolically and in code the likelihood and prior probability of a Bayesian model
* Understand and implement methods for estimating models, including optimisers, MCMC samplers, and approximation methods, in both R and Stan
* Visualise, evaluate, and understand model output


## Schedule

<table>
	<tr>
		<th> Date </th> <th> Topics </th> <th> Lecture Notes </th> <th> Exercises </th>
	</tr>
	<tr>
		<td>
			<p><b>Thursday</b> 21.11</p>
			<p>13:15–17:00</p>
		</td>
		<td>
			<p>Intro, Probability review</p>
			<p>Distributions</p>
		</td>
		<td><a href="lec/1_probability">Probability & Distributions</a></td>
		<td>
			<p><a href = "ex/ex1_distributions">Distributions in R</a></p>
			<p class = "soln"><a href = "ex/soln1_distributions.html">Solutions</a></p>
		</td>
	</tr>
	<tr>
		<td>
			<p><b>Tuesday</b> 26.11</p>
			<p>13:15–17:00</p>
		</td>
		<td>
			<p>Maximum likelihood</p>
			<p>Optimisation</p>
			<p>Markov-chain Monte Carlo</p>
		</td>
		<td>
			<p><a href="lec/2_mle">Maximum Likelihood Estimation</a></p>
			<a href="lec/3_mcmc">MCMC & Sampling</a>
		</td>
		<td>
			<p><a href = "ex/ex2_tree.html">Tree mortality</a></p>
			<p class = "soln"><a href = "ex/soln2_tree.html">Solutions</a></p>
			<p><a href = "ex/ex3_tank">German tank problem</a></p>
		</td>
	</tr>
	<tr>
		<td>
			<p><b>Thursday</b> 28.11</p>
			<p>13:15–17:00</p>
		</td>
		<td>
			<p>Inference I: Sampling &amp; hypothesis tests</p>
		</td>
		<td><a href="lec/4_inference_i">Inference I</a></td>
		<td>
			<p><a href = "ex/ex3_tank">German tank problem</a></p>
			<p class = "soln"><a href = "ex/soln3_tank.html">Solutions</a></p>
			<p class = "ex"><a href = "ex/ex4_birddisp.html">Bird dispersal</a></p>
				<p class = "soln"><a href = "ex/soln4_birddisp.html">Solutions</a></p>
		</td>
	</tr>
	<tr>
		<td>
			<p><b>Friday</b> 29.11</p>
			<p>13:15–17:00</p>
		</td>
		<td>
			<p>Generalised linear models</p>
		</td>
		<td>
			<p><a href="lec/5_regression">Regression &amp; GLM</a></p>
		</td>
		<td>
			
			<p class = "ex"><a href = "ex/ex5_kung.html">!Kung height</a></p>
				<!--<p class = "soln"><a href = "ex/soln">Solutions</a></p>-->
			<p class = "ex"><a href = "ex/ex6_birddiv_glm.html">Bird diversity</a></p>
		</td>
	</tr>
	<tr>
		<td>
			<p><b>Tuesday</b> 03.12</p>
			<p>13:15–17:00</p>
		</td>
		<td>
			<p><b>Inference II:</b></p>
				<p class = "soln">Priors & Diagnostics</p>
				<p class = "soln">Bayesian workflow</p>
		</td>
		<td>
			<p><a href="lec/6_inference_ii">Inference II</a></p>
		</td>
		<td>
			<p class = "ex"><a href = "ex/"></a></p>
			<!--<p class = "soln"><a href = "ex/soln">Solutions</a></p>-->
		</td>
	</tr>
	<tr>
 		<td>
			<p><b>Thursday</b> 05.12</p>
			<p>13:15–17:00</p>
		</td>
		<td>
			<p>Hierarchical &amp; Multilevel Models</p>
			<p><b>Inference III:</b></p>
				<p class = "soln">Model selection</p>
				<p class = "soln">Multimodel inference</p>
		</td>
		<td>
			<p><a href="lec/7_hm">Hierarchical Models</a></p>
			<a href="lec/8_model_selection">Model selection</a>
		</td>
		<td>
			<p>Exercises catch-up</p>
			<p>Project work</p>
		</td>
	</tr>
 	<tr>
		<td>
			<p><b>Thursday</b> 12.12</p>
			<p>13:15–17:00</p>
			<p class = "soln">Meet in Praktikumsraum Biologie</p>
		</td>
		<td>
			<p>Special Topics</p>
			<p>Wrap-up</p>
			<p>Presentations</p>
		</td>
		<td>
			<a href="lec/9_advanced_models">Advanced Models</a>
		</td>
		<td></td>
	</tr>
</table>

## Exercises
Most lectures will include exercises, which can be completed individually or in groups. I encourage you to work through them as much as you can. I will not grade the exercises, and it is not necessary to turn them in, but I'm happy to provide individual feedback/help as needed. During official meeting times, I will also walk through the exercises (as much as time allows) and explain the code to everyone at once.

## Course files
All of the files for the course are on Github. To create a local copy on your computer, you can follow the instructions [here](https://github.com/ltalluto/vu_advstats_students).

## Projects
Everyone will complete a data analysis group project using a Bayesian analysis of your choice. I am happy to provide feedback to your group as you are developing your project to help steer you toward the proper analysis. Projects will be presented on the last day of instruction. Presentations should be roughly 10-15 minutes, and should include a brief description of the data and the scientific questions, an explanation of the model structure and why the structure is appropriate, other technical details that will help the other groups understand your model, and the status (MCMC diagnostics, results, etc). Additionally, you should collectively prepare a short write-up of your project, to be submitted by the end of the semester. This write up should be more complete than the presentation, with a short introduction, methods section detailing the model structure and why it was chosen, a **brief** description of the dataset and any information needed to understand it, results with figures as appropriate, and a short discussion with some interpretation of your model results.

These write-ups are due on **28.02.2025**