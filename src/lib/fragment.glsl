// #version 330 core

uniform float uTime;
varying vec2 vUv;
uniform vec2 uMouse;
uniform vec2 uResolution;

#define NUM_OCTAVES 5

float rand(vec2 n){
    return fract(sin(dot(n,vec2(12.9898,4.1414)))*43758.5453);
}

float noise(vec2 p){
    vec2 ip=floor(p);
    vec2 u=fract(p);
    u=u*u*(3.-2.*u);
    
    float res=mix(
        mix(rand(ip),rand(ip+vec2(1.,0.)),u.x),
        mix(rand(ip+vec2(0.,1.)),rand(ip+vec2(1.,1.)),u.x),u.y);
        return res*res;
    }
    
    float fbm(vec2 x){
        float v=0.;
        float a=.5;
        vec2 shift=vec2(100);
        // Rotate to reduce axial bias
        mat2 rot=mat2(cos(.5),sin(.5),-sin(.5),cos(.50));
        for(int i=0;i<NUM_OCTAVES;++i){
            v+=a*noise(x);
            x=rot*x*2.+shift;
            a*=.5;
        }
        return v;
    }
    
    // vec2 rotate(vec2 v,float a){
        //     float s=sin(a);
        //     float c=cos(a);
        //     mat2 m=mat2(c,s,-s,c);
        //     return m*v;
    // }
    
    vec3 hsv(vec3 c)
    {
        vec4 K=vec4(1.,2./3.,1./3.,3.);
        vec3 p=abs(fract(c.xxx+K.xyz)*6.-K.www);
        return c.z*mix(K.xxx,clamp(p-K.xxx,0.,1.),c.y);
    }
    
    void main(void)
    {
        vec2 uv=vUv;
        
        // Find the distance to the mouse
        vec2 mouse=uMouse/uResolution;
        mouse.y=1.-mouse.y;
        // mouse.y=-mouse.y;
        float dist=distance(uv,mouse);
        float strength=smoothstep(.0,.8,dist);
        
        float hue=fract(uTime*.005);
        
        // vec3 rgb1=hsv(vec3(hue,.9,.85));
        // vec3 rgb2=hsv(vec3(hue+.07,.85,.75));
        
        vec4 color1=vec4(.122,.561,1.,1.);
        
        vec4 color2=vec4(.6,.8,1.,1.);
        
        float grain=mix(.3*strength,-.2*strength,rand(100.*uv));
        
        // make movement for fbm
        vec2 movement=vec2(uTime*.005,uTime*-.005);
        // movement*=rotate(uv,uTime*.025);
        
        float f=fbm(uv*3.+movement);
        f*=3.;
        f+=grain;
        f+=uTime*.005;
        f=fract(f);
        
        float gap=mix(.4,.01,strength);
        float mixer=smoothstep(0.,gap,f)-smoothstep(.6,1.,f);
        vec4 color=mix(color1,color2,mixer);
        gl_FragColor=color;
    }
    