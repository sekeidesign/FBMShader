// #version 330 core

uniform float uTime;
varying vec2 vUv;

float random(vec2 st){
    // Create a unique float value based on st
    return fract(sin(dot(st.xy,vec2(12.9898,78.233)))*43758.5453123);
}

void main(void)
{
    vec2 uv=vUv;
    
    vec4 color1=vec4(.9529,.6353,0.,1.);
    vec4 color2=vec4(.9,.8,1.,1.);
    
    float f=smoothstep(0.,2.,uv.x+random(uv));
    
    vec4 color=mix(color1,color2,f);
    gl_FragColor=color;
}