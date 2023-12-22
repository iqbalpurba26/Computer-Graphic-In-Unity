Shader "Custom/JetSky"
{
    Properties
    {
        _choiceEnable("Choice Enable", Range(0,1)) = 0.0
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _Glossiness("Smoothness", Range(0,1)) = 0.5
        _Metallic("Metallic", Range(0,1)) = 0.0
    }
        SubShader
        {
            Tags { "RenderType" = "Opaque" }
            LOD 200

            CGPROGRAM
            // Physically based Standard lighting model, and enable shadows on all light types
            #pragma surface surf Standard fullforwardshadows

            // Use shader model 3.0 target, to get nicer looking lighting
            #pragma target 3.0

            sampler2D _MainTex;

            struct Input
            {
                float2 uv_MainTex;
                float3 worldPos;
            };

            half _Glossiness;
            half _Metallic;
            half _choiceEnable;
            fixed4 _ColorVariable;

            // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
            // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
            // #pragma instancing_options assumeuniformscaling
            UNITY_INSTANCING_BUFFER_START(Props)
                // put more per-instance properties here
            UNITY_INSTANCING_BUFFER_END(Props)

            void surf(Input IN, inout SurfaceOutputStandard o)
            {
                fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _ColorVariable;
                o.Albedo = c.xyz;
                if (_choiceEnable == 0.0) {
                    

                    // Albedo comes from a texture tinted by color

                    float time = _Time.y;

                    // Menggunakan fungsi sin untuk membuat perubahan warna seiring waktu
                    float red = sin(2.0 * time) * 0.5 + 0.5;
                    float green = cos(1.5 * time) * 0.5 + 0.5;
                    float blue = sin(1.0 * time) * 0.5 + 0.5;
                    // Menerapkan nilai-nilai warna ke _ColorVariable
                    _ColorVariable = fixed4(red, green, blue, 1.0);
                }
                if (_choiceEnable == 1.0) {
                    _ColorVariable = fixed4(0.0,0.0, 0.0, 1.0);
                }

                

                // Albedo comes from a texture tinted by color
                o.Albedo = _ColorVariable.rgb;

                // o.Albedo = c.rgb;
                // Metallic and smoothness come from slider variables
                o.Metallic = _Metallic;
                o.Smoothness = _Glossiness;
                o.Alpha = c.a;
            }
            ENDCG
        }
            FallBack "Diffuse"
}
