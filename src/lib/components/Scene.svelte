<script>
	import { T } from '@threlte/core';
	import fragmentShader from '$lib/fragment.glsl?raw';
	import vertexShader from '$lib/vertex.glsl?raw';
	let time = 0.0;

	function animate() {
		requestAnimationFrame(animate);

		// Update the time uniform
		time += 0.05;
	}
	animate();
</script>

<T.PerspectiveCamera makeDefault position={[0, 1.5, 10]} fov={15}></T.PerspectiveCamera>

<T.Mesh position={[0, 1.5, 0]} rotation={[0, 0, 0]}>
	<T.PlaneGeometry args={[2, 2, 1]} />
	<T.ShaderMaterial
		{vertexShader}
		{fragmentShader}
		uniforms={{
			uTime: { value: 0.0 }
		}}
		uniforms.uTime.value={time}
	></T.ShaderMaterial>
</T.Mesh>
