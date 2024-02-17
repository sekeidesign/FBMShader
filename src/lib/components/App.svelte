<script>
	import { gsap } from 'gsap/dist/gsap';
	import { TextPlugin } from 'gsap/dist/TextPlugin';
	import { Canvas } from '@threlte/core';
	import { onMount } from 'svelte';

	import Scene from './Scene.svelte';
	import plannedLogo from '$lib/PlannedLogo.svg';
	import plannedAI from '$lib/PlannedAI.svg';
	import brandMark from '$lib/BrandMark.svg';
	import ogImage from '$lib/ogImage.png';

	onMount(() => {
		gsap.registerPlugin(TextPlugin);
		const tl = gsap.timeline({ defaults: { duration: 0.8, ease: 'power4.inOut' } });
		tl.to('.brand-mark', { opacity: 1, y: 0 });
		tl.to('.loader-text > *', { opacity: 1, y: 0, stagger: 0.1 }, '-=.6');
		tl.to('.loader-text > *', { opacity: 0, y: -40, stagger: 0.1 }, '+=.2');
		tl.to('.loader-blue', { scaleY: 0, transformOrigin: 'top' }, '-=.5');
		tl.to('.loader-white', { scaleY: 0, transformOrigin: 'top' }, '-=.65');
		tl.to('.logo > *', { y: 0, opacity: 1, stagger: 0.1, duration: 1.5 }, '-=.8');
		tl.to(
			'.text-1',
			{
				speed: 40,
				text: 'We’re reinventing the way corporate events are planned.'
				// delimiter: ' '
			},
			'-=.8'
		);
		tl.to(
			'.text-2',
			{
				speed: 40,
				text: 'Let us automate the boring stuff, so you can focus on the details that matter.',
				delimiter: ' '
			},
			'-=.2'
		);
	});

	const title = 'Planned AI Shader Experiment';
	const description = 'Learning WebGL, while practicing GSAP, just for fun';
</script>

<svelte:head>
	<title>{title}</title>
	<meta name="description" content={description} />
	<meta property="og:title" content={title} />
	<meta property="og:description" content={description} />
	<meta property="og:image" content={ogImage} />
</svelte:head>

<img
	src={brandMark}
	class="w-10 fixed top-10 left-10 z-50 brand-mark"
	style="opacity: 0; transform: translateY(32px);"
	alt=""
/>
<div class="w-screen h-screen fixed z-20">
	<div
		class="absolute z-30 p-10 text-5xl gap-2 text-white font-aeonik bottom-0 left-0 flex flex-col loader-text"
	>
		<span style="opacity: 0; transform: translateY(32px);">Briefs</span>
		<span style="opacity: 0; transform: translateY(32px);">Sourcing</span>
		<span style="opacity: 0; transform: translateY(32px);">Negotiation</span>
		<span style="opacity: 0; transform: translateY(32px);">Booking</span>
	</div>
	<div class="absolute z-20 w-full h-full bg-[#1F8FFF] loader-blue"></div>
	<div class="absolute z-10 w-full h-full bg-white loader-white"></div>
</div>
<div
	class="grid grid-rows-8 grid-cols-4 lg:grid-cols-10 p-10 z-10 fixed h-screen w-screen font-aeonik text-white"
>
	<div class="flex gap-1.5 items-start col-span-4 row-start-6 logo">
		<img
			src={plannedLogo}
			alt=""
			style="height: clamp(2.5rem, 8vh, 3.5rem); max-width: 65vw; opacity: 0; transform: translateY(32px);"
		/>
		<img
			src={plannedAI}
			alt=""
			class="mt-0.5"
			style="height: clamp(.75rem, 3vh, 1.75rem); opacity: 0; transform: translateY(32px);"
		/>
	</div>
	<p class="text-xl col-span-3 lg:col-start-6 row-start-7 lg:row-start-6 text-1"></p>
	<p class="text-xl col-span-3 lg:col-start-6 row-start-8 lg:row-start-7 text-2"></p>
</div>
<div class="canvas-size">
	<Canvas>
		<Scene />
	</Canvas>
</div>

<style>
	.canvas-size {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		width: 100vw;
		height: 100vh;
	}
</style>
