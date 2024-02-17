<script>
	import { T } from '@threlte/core';
	import { OrbitControls } from '@threlte/extras';
	import { Vector2 } from 'three';
	import fragmentShader from '$lib/fragment.glsl?raw';
	import vertexShader from '$lib/vertex.glsl?raw';
	import { tweened } from 'svelte/motion';
	import { quadOut } from 'svelte/easing';
	import { windowSizeStore, mouseStore } from 'svelte-legos';
	let time = 0.0;

	const size = windowSizeStore();
	const sizeUniform = new Vector2();
	$: sizeUniform.set($size.width, $size.height);
	$: s = Math.max($size.width, $size.height);
	const position = mouseStore();
	// Create a new THREE.Vector2 for the uniform
	// Create a tweened store for the position with an initial value and configuration
	const positionTweened = tweened(
		{ x: 0, y: 0 },
		{
			duration: 600,
			easing: quadOut
		}
	);

	// Update the tweened position whenever the mouse position changes
	$: if ($position) {
		positionTweened.set($position);
	}

	// Create a new THREE.Vector2 for the uniform
	const positionUniform = new Vector2();

	// Update the uniform whenever the tweened position changes
	$: if ($positionTweened) {
		positionUniform.set($positionTweened.x, $positionTweened.y);
	}

	function animate() {
		requestAnimationFrame(animate);

		// Update the time uniform
		time += 0.05;
	}
	animate();
</script>

<!-- <T.PerspectiveCamera makeDefault orbi position={[0, 0, 10]} fov={15}>
	<OrbitControls></OrbitControls></T.PerspectiveCamera
> -->

<T.OrthographicCamera makeDefault position={[0, 0, 1]}></T.OrthographicCamera>

<T.Mesh position={[0, 0, 0]} rotation={[0, 0, 0]}>
	<T.PlaneGeometry args={[s, s]} />
	<T.ShaderMaterial
		{vertexShader}
		{fragmentShader}
		uniforms={{
			uTime: { value: 0.0 },
			uSpeed: { value: 1.0 },
			uIntensity: { value: 1.0 },
			uMouse: { value: positionUniform },
			uResolution: { value: sizeUniform }
		}}
		uniforms.uTime.value={time}
	></T.ShaderMaterial>
</T.Mesh>
