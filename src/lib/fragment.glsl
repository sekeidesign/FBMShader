// #version 330 core

uniform float uTime;
varying vec2 vUv;

void main(void)
{
    vec4 color=vec4(vUv,1.,1.);
    gl_FragColor=color;
}