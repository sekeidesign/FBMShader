<script>
	import { Canvas } from '@threlte/core';
	import Scene from './Scene.svelte';
	import plannedLogo from '$lib/PlannedLogo.svg';
	import plannedAI from '$lib/PlannedAI.svg';
	import brandMark from '$lib/BrandMark.svg';
</script>

<img src={brandMark} class="w-10 fixed top-10 left-10 z-50" alt="" />
<div class="w-screen h-screen fixed z-20">
	<div
		class="absolute z-30 p-10 text-5xl gap-2 text-white font-aeonik bottom-0 left-0 flex flex-col"
	>
		<span>Briefs</span>
		<span>Sourcing</span>
		<span>Negotiation</span>
		<span>Booking</span>
	</div>
	<div class="absolute z-20 w-full h-full bg-[#1F8FFF]"></div>
	<div class="absolute z-10 w-full h-full bg-white"></div>
</div>
<div class="grid grid-rows-8 grid-cols-10 p-10 z-10 fixed h-screen w-screen font-aeonik text-white">
	<div class="flex gap-1.5 items-start col-span-4 row-start-5">
		<img src={plannedLogo} alt="" style="height: clamp(3rem, 10vh, 4rem);" />
		<img src={plannedAI} alt="" class="mt-0.5" style="height: clamp(1rem, 3.33vh, 2rem);" />
	</div>
	<p class="text-xl col-span-3 col-start-6 row-start-5">
		We’re reinventing the way corporate events are planned.
	</p>
	<p class="text-xl col-span-3 col-start-6 row-start-6">
		We automate the boring stuff, so you can focus on the details that matter.
	</p>
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
