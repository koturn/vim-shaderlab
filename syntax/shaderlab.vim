" Vim syntax file
" Language:     ShaderLab
" Maintainer:   mingchaoyan <mingchaoyan@gmail.com>
"

if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syntax case ignore
syntax keyword shaderlabKeyword
      \ Shader
      \ Category
      \ Properties
      \ SubShader
      \ Name
      \ Pass
      \ Tags
      \ LOD
      \ Fallback
      \ CustomEditor
      \ Fog
      \ BindChannels
      \ ColorMask
      \ Offset
      \ ColorMaterial
      \ UsePass
      \ GrabPass
syntax case match

syntax keyword shaderlabKeywordAlphaTest AlphaTest nextgroup=shaderlabKeywordValueAlphaTest skipwhite skipempty
syntax keyword shaderlabKeywordValueAlphaTest
      \ Off
      \ Greater
      \ GEqual
      \ Less
      \ LEqual
      \ Equal
      \ NotEqual
      \ Always
      \ Never
      \ contained

syntax keyword shaderlabKeywordAlphaToMask AlphaToMask nextgroup=shaderlabKeywordValueAlphaToMask skipwhite skipempty
syntax keyword shaderlabKeywordValueAlphaToMask On Off contained

syntax keyword shaderlabKeywordBlend Blend nextgroup=shaderlabKeywordIndexBlend,shaderlabKeywordValueBlend skipwhite skipempty
syntax match shaderlabKeywordIndexBlend '\<[0-7]\>' contained nextgroup=shaderlabKeywordValueBlend skipwhite skipempty
syntax keyword shaderlabKeywordValueBlend
      \ Off
      \ One
      \ Zero
      \ SrcColor
      \ SrcAlpha
      \ DstColor
      \ DstAlpha
      \ OneMinusSrcColor
      \ OneMinusSrcAlpha
      \ OneMinusDstColor
      \ OneMinusDstAlpha
      \ contained nextgroup=shaderlabKeywordValueBlend skipwhite skipempty

syntax keyword shaderlabKeywordBlendOp BlendOp nextgroup=shaderlabKeywordIndexBlendOp,shaderlabKeywordValueBlendOp skipwhite skipempty
syntax match shaderlabKeywordIndexBlendOp '\<[0-7]\>' contained nextgroup=shaderlabKeywordValueBlendOp skipwhite skipempty
syntax keyword shaderlabKeywordValueBlendOp
      \ Add
      \ Sub
      \ RevSub
      \ Min
      \ Max
      \ LogicalClear
      \ LogicalSet
      \ LogicalCopy
      \ LogicalCopyInverted
      \ LogicalNoop
      \ LogicalInvert
      \ LogicalAnd
      \ LogicalNand
      \ LogicalOr
      \ LogicalNor
      \ LogicalXor
      \ LogicalEquiv
      \ LogicalAndReverse
      \ LogicalAndInverted
      \ LogicalOrReverse
      \ LogicalOrInverted
      \ contained nextgroup=shaderlabKeywordCommaBlendOp skipwhite skipempty
syntax match shaderlabKeywordCommaBlendOp ',' contained nextgroup=shaderlabKeywordValueBlendOp skipwhite skipempty

syntax keyword shaderlabKeywordCull Cull nextgroup=shaderlabKeywordValueCull skipwhite skipempty
syntax keyword shaderlabKeywordValueCull Back Front Off contained

syntax keyword shaderlabKeywordFog Fog nextgroup=shaderlabKeywordFogBlock skipwhite skipempty
syntax region shaderlabKeywordFogBlock start='{' skip='$' end='}' contained contains=shaderlabKeywordFogSub,shaderlabKeywordFogMode
syntax keyword shaderlabKeywordFogSub Color Density Range contained
syntax keyword shaderlabKeywordFogMode Mode contained nextgroup=shaderlabKeywordValueFogMode skipwhite skipempty
syntax keyword shaderlabKeywordValueFogMode Off Global Linear Exp Exp2 contained

syntax keyword shaderlabKeywordStencil Stencil nextgroup=shaderlabKeywordStencilBlock skipwhite skipempty
syntax region shaderlabKeywordStencilBlock start='{' skip='$' end='}' contained contains=shaderlabKeywordStencilSub,shaderlabKeywordStencilComp,shaderlabKeywordStencilOp
syntax keyword shaderlabKeywordStencilSub Ref ReadMask WriteMask contained
syntax keyword shaderlabKeywordStencilComp Comp CompFront CompBack contained nextgroup=shaderlabKeywordValueStencilComp skipwhite skipempty
syntax keyword shaderlabKeywordValueStencilComp Greater GEqual Less LEqual Equal NotEqual Always Never contained
syntax keyword shaderlabKeywordStencilOp Pass PassFront PassBack Fail FailFront FailBack ZFail ZFailFront ZFailBack contained nextgroup=shaderlabKeywordValueStencilOp skipwhite skipempty
syntax keyword shaderlabKeywordValueStencilOp Keep Zero Replace IncrSat DecrSat Invert IncrWrap DecrWrap contained

syntax keyword shaderlabKeywordLighting Lighting nextgroup=shaderlabKeywordValueLighting skipwhite skipempty
syntax keyword shaderlabKeywordValueLighting On Off contained

syntax keyword shaderlabKeywordMaterial Material nextgroup=shaderlabKeywordMaterialBlock skipwhite skipempty
syntax region shaderlabKeywordMaterialBlock start='{' skip='$' end='}' contained contains=shaderlabKeywordMaterialSub
syntax keyword shaderlabKeywordMaterialSub Diffuse Ambient Specular Shininess Emission contained

syntax keyword shaderlabKeywordSeparateSpecular SeparateSpecular nextgroup=shaderlabKeywordValueSeparateSpecular skipwhite skipempty
syntax keyword shaderlabKeywordValueSeparateSpecular On Off contained

syntax keyword shaderlabKeywordZTest ZTest nextgroup=shaderlabKeywordValueZTest skipwhite skipempty
syntax keyword shaderlabKeywordValueZTest Less Greater LEqual GEqual NotEqual Always contained

syntax keyword shaderlabKeywordZWrite ZWrite nextgroup=shaderlabKeywordValueZWrite skipwhite skipempty
syntax keyword shaderlabKeywordValueZWrite On Off contained

syntax keyword shaderlabKeywordZClip ZClip nextgroup=shaderlabKeywordValueZClip skipwhite skipempty
syntax keyword shaderlabKeywordValueZClip True False contained

" syntax keyword shaderlabKeywordProperties Properties nextgroup=shaderlabKeywordPropertyBlock skipwhite skipempty
" syntax keyword shaderlabKeywordProperties Properties

" syntax region shaderlabKeywordPropertyBlock start='{' skip='$' end='}' contained contains=shaderlabProperty
" syntax keyword shaderlabProperty Int Float Range Vector Color 2D 3D Cube contained

" syntax region shaderlabBlock start='{' skip='$' end='}' contains=ALL
" syntax region shaderlabKeywordPropertyBlock start='{' skip='$' end='}' contained contains=ALL
" syntax keyword shaderlabProperty Int Float Range Vector Color 2D 3D Cube contained containedin=shaderlabKeywordPropertyBlock
syntax keyword shaderlabProperty Int Float Range Vector Color 2D 3D Cube

syntax keyword shaderlabStorageClass static const inline uniform precise in out inout
syntax keyword shaderlabInterpolationModifier linear centroid nointerpolation noperspective sample

syntax keyword shaderlabType namespace typedef struct class void SurfaceOutput PointStream LineStream TriangleStream point line triangle lineadj triangleadj SamplerState SamplerComparisonState InputPatch OutputPatch
syntax match shaderlabType display '\<\%(half\|\%(min1[06]\)\?float\|\%(min16\)\?u\?int\|bool\)\%([1-4]\%(x[1-4]\)\?\)\?\>'
syntax match shaderlabType display '\<\%(fixed\)\%(\([2-4]\)\%(x\1\)\?\)\?\>'
syntax match shaderlabType display '\<sampler\%(2D\|CUBE\|3D\)\%(_\%(half\|float\)\)\?\>'
syntax match shaderlabType display '\<Texture\%(2D\%(Array\|MS\)\?\|Cube\%(Array\)\?\|3D\)\%(_\%(half\|float\)\)\?\>'

syntax keyword shaderlabAttrType
      \ Enum
      \ Gamma
      \ HDR
      \ Header
      \ HideInInspector
      \ IntRange
      \ KeywordEnum
      \ MainColor
      \ MainTexture
      \ MaterialToggle
      \ NoScaleOffset
      \ Normal
      \ PerRendererData
      \ PowerSlider
      \ Space
      \ Toggle
      \ ToggleOff

syntax match shaderlabAttribute '\[\s*\<\%(branch\|flatten\|loop\|fastopt\)\>\s*\]'
syntax match shaderlabAttribute '\[\s*\<unroll\>\%(\s*(\s*\d\+\s*)\)\?\s*\]'
syntax match shaderlabAttribute '\[\s*\<\%(maxvertexcount\|\%(UNITY_\)\?outputcontrolpoints\)\>\s*(\s*\d\+\s*)\s*\]'
syntax match shaderlabAttribute '\[\s*\<\%(\%(UNITY_\)\?\%(domain\|partitioning\|outputtopology\|patchconstantfunc\)\)\>\s*(\s*"[^"]*"\s*)\s*\]'
syntax keyword shaderlabAttribute UNITY_BRANCH UNITY_FLATTEN UNITY_UNROLL UNITY_LOOP UNITY_FASTOPT

syntax keyword shaderlabSemantics
      \ POSITION
      \ NORMAL
      \ TANGENT
      \ COLOR
      \ DEPTH
      \ FACE
      \ VPOS
      \ SV_POSITION
      \ SV_Position
      \ SV_VertexID
      \ SV_PrimitiveID
      \ SV_InstanceID
      \ SV_Target
      \ SV_Depth
      \ SV_IsFrontFace
      \ SV_TessFactor
      \ SV_InsideTessFactor
      \ SV_OutputControlPointID
      \ SV_DomainLocation
      \ SV_RenderTargetArrayIndex
syntax match shaderlabSemantics display '\<\%(TEXCOORD\|SV_Target\|COLOR\)\d\>'

syntax keyword shaderlabFunction
      \ combine
      \ SetTexture
      \ ODSOffset
      \ UnityObjectToClipPosODS
      \ UnityObjectToClipPos
      \ UnityGet2DClipping

syntax keyword shaderlabFunction1
      \ abs
      \ acos
      \ all
      \ any
      \ asin
      \ atan
      \ atan2
      \ ceil
      \ clamp
      \ clip
      \ cos
      \ cosh
      \ cross
      \ D3DCOLORtoUBYTE4
      \ degrees
      \ determinant
      \ distance
      \ dot
      \ exp
      \ exp2
      \ faceforward
      \ floor
      \ fmod
      \ frac
      \ isfinite
      \ isinf
      \ isnan
      \ ldexp
      \ length
      \ lerp
      \ lit
      \ log
      \ log10
      \ log2
      \ max
      \ min
      \ modf
      \ mul
      \ noise
      \ normalize
      \ pow
      \ radians
      \ reflect
      \ refract
      \ round
      \ rsqrt
      \ saturate
      \ sign
      \ sin
      \ sincos
      \ sinh
      \ smoothstep
      \ sqrt
      \ step
      \ tan
      \ tanh
      \ tex1D
      \ tex2D
      \ tex2DArray
      \ tex3D
      \ texCUBE
      \ transpose
      \ trunc

syntax keyword shaderlabFunction2
      \ ddx
      \ ddy
      \ frexp
      \ fwidth
      \ tex1Dbias
      \ tex1Dgrad
      \ tex1Dproj
      \ tex2Dbias
      \ tex2Dgrad
      \ tex2Dproj
      \ tex2DArraybias
      \ tex2DArraygrad
      \ tex2DArrayproj
      \ tex3Dbias
      \ tex3Dgrad
      \ tex3Dproj
      \ texCUBEbias
      \ texCUBEgrad
      \ texCUBEproj

syntax keyword shaderlabFunction3
      \ tex1Dlod
      \ tex2Dlod
      \ tex2DArraylod
      \ tex3Dlod
      \ texCUBElod

syntax keyword shaderlabFunction4
      \ abort
      \ asfloat
      \ asint
      \ asuint
      \ errorf
      \ GetRenderTargetSampleCount
      \ GetRenderTargetSamplePosition
      \ printf

syntax keyword shaderlabFunction5
      \ AllMemoryBarrier
      \ AllMemoryBarrierWithGroupSync
      \ asdouble
      \ CheckAccessFullyMapped
      \ countbits
      \ ddx_coarse
      \ ddx_fine
      \ ddy_coarse
      \ ddy_fine
      \ DeviceMemoryBarrier
      \ DeviceMemoryBarrierWithGroupSync
      \ dst
      \ EvaluateAttributeAtCentroid
      \ EvaluateAttributeAtSample
      \ EvaluateAttributeSnapped
      \ f16tof32
      \ f32tof16
      \ firstbithigh
      \ firstbitlow
      \ fma
      \ GroupMemoryBarrier
      \ GroupMemoryBarrierWithGroupSync
      \ InterlockedAdd
      \ InterlockedAnd
      \ InterlockedCompareExchange
      \ InterlockedCompareStore
      \ InterlockedExchange
      \ InterlockedMax
      \ InterlockedMin
      \ InterlockedOr
      \ InterlockedXor
      \ mad
      \ msad4
      \ Process2DQuadTessFactorsAvg
      \ Process2DQuadTessFactorsMax
      \ Process2DQuadTessFactorsMin
      \ ProcessIsolineTessFactors
      \ ProcessQuadTessFactorsAvg
      \ ProcessQuadTessFactorsMax
      \ ProcessQuadTessFactorsMin
      \ ProcessTriTessFactorsAvg
      \ ProcessTriTessFactorsMax
      \ ProcessTriTessFactorsMin
      \ rcp
      \ reversebits

syntax keyword shaderlabMacro
      \ SHADER_TARGET
      \ SHADER_API_D3D11
      \ SHADER_API_GLCORE
      \ SHADER_API_GLES
      \ SHADER_API_GLES3
      \ SHADER_API_METAL
      \ SHADER_API_VULKAN
      \ SHADER_API_D3D11_9X
      \ SHADER_API_PS4
      \ SHADER_API_XBOXONE
      \ UNITY_NO_SCREENSPACE_SHADOWS
      \ UNITY_NO_LINEAR_COLORSPACE
      \ UNITY_NO_RGBM
      \ UNITY_NO_DXT5nm
      \ UNITY_FRAMEBUFFER_FETCH_AVAILABLE
      \ UNITY_USE_RGBA_FOR_POINT_SHADOWS
      \ UNITY_POSITION
      \ UNITY_ATTEN_CHANNEL
      \ UNITY_HALF_TEXEL_OFFSET
      \ UNITY_UV_STARTS_AT_TOP
      \ UNITY_MIGHT_NOT_HAVE_DEPTH_Texture
      \ UNITY_PROJ_COORD
      \ UNITY_CAN_COMPILE_TESSELLATION
      \ UNITY_INITIALIZE_OUTPUT
      \ UNITY_COMPILER_HLSL
      \ UNITY_COMPILER_HLSL2GLSL
      \ UNITY_COMPILER_CG
      \ UNITY_DECLARE_SHADOWMAP
      \ UNITY_DECLARE_TEX2D
      \ UNITY_DECLARE_TEX2D_HALF
      \ UNITY_DECLARE_TEX2D_FLOAT
      \ UNITY_DECLARE_TEX2D_NOSAMPLER
      \ UNITY_DECLARE_TEX2D_NOSAMPLER_HALF
      \ UNITY_DECLARE_TEX2D_NOSAMPLER_FLOAT
      \ UNITY_DECLARE_TEX2D_NOSAMPLER_INT
      \ UNITY_DECLARE_TEX2D_NOSAMPLER_UINT
      \ UNITY_DECLARE_TEX2DARRAY
      \ UNITY_DECLARE_TEX2DARRAY_NOSAMPLER
      \ UNITY_DECLARE_TEX2DARRAY_MS
      \ UNITY_DECLARE_TEX2DARRAY_MS_NOSAMPLER
      \ UNITY_DECLARE_TEX3D
      \ UNITY_DECLARE_TEX3D_HALF
      \ UNITY_DECLARE_TEX3D_FLOAT
      \ UNITY_DECLARE_TEX3D_NOSAMPLER
      \ UNITY_DECLARE_TEX3DARRAY
      \ UNITY_DECLARE_TEXCUBE_SHADOWMAP
      \ UNITY_DECLARE_TEXCUBE
      \ UNITY_DECLARE_TEXCUBE_NOSAMPLER
      \ UNITY_DECLARE_TEXCUBEARRAY
      \ UNITY_DECLARE_TEXCUBEARRAY_NOSAMPLER
      \ UNITY_DECLARE_SCREENSPACE_SHADOWMAP
      \ UNITY_DECLARE_DEPTH_TEXTURE_MS
      \ UNITY_DECLARE_DEPTH_TEXTURE
      \ UNITY_DECLARE_SCREENSPACE_TEXTURE
      \ UNITY_PASS_FORWARDBASE
      \ UNITY_PASS_FORWARDADD
      \ UNITY_PASS_DEFERRED
      \ UNITY_PASS_SHADOWCASTER
      \ UNITY_PASS_PREPASSBASE
      \ UNITY_PASS_PREPASSFINAL
      \ UNITY_SHADER_NO_UPGRADE
      \ UNITY_VERTEX_INPUT_INSTANCE_ID
      \ CBUFFER_START
      \ CBUFFER_END
      \ GLOBAL_CBUFFER_START
      \ GLOBAL_CBUFFER_END

syntax keyword shaderlabMacroFunction
      \ SAMPLE_DEPTH_TEXTURE
      \ SAMPLE_DEPTH_TEXTURE_PROJ
      \ SAMPLE_DEPTH_TEXTURE_LOD
      \ SAMPLE_RAW_DEPTH_TEXTURE
      \ SAMPLE_RAW_DEPTH_TEXTURE_PROJ
      \ SAMPLE_RAW_DEPTH_TEXTURE_LOD
      \ SAMPLE_DEPTH_CUBE_TEXTURE
      \ UNITY_PROJ_COORD
      \ UNITY_SAMPLE_DEPTH
      \ UNITY_SAMPLE_SHADOW
      \ UNITY_SAMPLE_SHADOW_PROJ
      \ UNITY_SAMPLE_TEXCUBE_SHADOW
      \ UNITY_SAMPLE_TEX2D
      \ UNITY_SAMPLE_TEX2D_SAMPLER
      \ UNITY_SAMPLE_TEX2DARRAY
      \ UNITY_SAMPLE_TEX2DARRAY_LOD
      \ UNITY_SAMPLE_TEX2DARRAY_SAMPLER
      \ UNITY_SAMPLE_TEX2DARRAY_SAMPLER_LOD
      \ UNITY_SAMPLE_TEX3D
      \ UNITY_SAMPLE_TEX3D_LOD
      \ UNITY_SAMPLE_TEX3D_SAMPLER
      \ UNITY_SAMPLE_TEX3D_SAMPLER_LOD
      \ UNITY_SAMPLE_TEX3DARRAY
      \ UNITY_SAMPLE_TEX3DARRAY_LOD
      \ UNITY_SAMPLE_TEXCUBE
      \ UNITY_SAMPLE_TEXCUBE_LOD
      \ UNITY_SAMPLE_TEXCUBE_SAMPLER
      \ UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD
      \ UNITY_SAMPLE_TEXCUBEARRAY
      \ UNITY_SAMPLE_TEXCUBEARRAY_LOD
      \ UNITY_SAMPLE_TEXCUBEARRAY_SAMPLER
      \ UNITY_SAMPLE_TEXCUBEARRAY_SAMPLER_LOD
      \ SampleCubeReflection
      \ UNITY_READ_FRAMEBUFFER_INPUT
      \ UNITY_READ_FRAMEBUFFER_INPUT_MS
      \ UNITY_SAMPLE_1CHANNEL
      \ UNITY_SAMPLE_SCREEN_SHADOW
      \ UNITY_SAMPLE_SCREENSPACE_TEXTURE
      \ texRECT
      \ texRECTlod
      \ texRECTbias
      \ texRECTproj

syntax keyword shaderlabStatement return discard break continue this
syntax keyword shaderlabConditional if else switch
syntax keyword shaderlabRepeat while for do
syntax keyword shaderlabLabel case default

syntax keyword shaderlabLangDirective CGPROGRAM CGINCLUDE ENDCG HLSLPROGRAM HLSLINCLUDE ENDHLSL

syntax keyword shaderlabMacroVariable
      \ glstate_matrix_projection
      \ unity_MatrixV
      \ unity_MatrixInvV
      \ unity_MatrixVP
      \ UNITY_MATRIX_P
      \ UNITY_MATRIX_V
      \ UNITY_MATRIX_I_V
      \ UNITY_MATRIX_VP
      \ UNITY_MATRIX_M
      \ UNITY_LIGHTMODEL_AMBIENT
      \ UNITY_MATRIX_MVP
      \ UNITY_MATRIX_MV
      \ UNITY_MATRIX_T_MV
      \ UNITY_MATRIX_IT_MV

syntax keyword shaderlabMacroConstant
      \ UNITY_ALLOWED_MRT_COUNT
      \ UNITY_MATRIX_TEXTURE0
      \ UNITY_MATRIX_TEXTURE1
      \ UNITY_MATRIX_TEXTURE2
      \ UNITY_MATRIX_TEXTURE3
      \ UNITY_NEAR_CLIP_VALUE

syntax keyword shaderlabVariable
      \ _Time
      \ _SinTime
      \ _CosTime
      \ _GrabTexture
      \ unity_DeltaTime
      \ _WorldSpaceCameraPos
      \ _ProjectionParams
      \ _ScreenParams
      \ _ZBufferParams
      \ unity_OrthoParams
      \ unity_HalfStereoSeparation
      \ unity_CameraWorldClipPlanes
      \ unity_CameraProjection
      \ unity_CameraInvProjection
      \ unity_WorldToCamera
      \ unity_CameraToWorld
      \ _WorldSpaceLightPos0
      \ _LightPositionRange
      \ _LightProjectionParams
      \ unity_4LightPosX0
      \ unity_4LightPosY0
      \ unity_4LightPosZ0
      \ unity_4LightAtten0
      \ unity_LightColor
      \ unity_LightPosition
      \ unity_LightAtten
      \ unity_SpotDirection
      \ unity_SHAr
      \ unity_SHAg
      \ unity_SHAb
      \ unity_SHBr
      \ unity_SHBg
      \ unity_SHBb
      \ unity_SHC
      \ unity_OcclusionMaskSelector
      \ unity_ProbesOcclusion
      \ unity_LightColor0
      \ unity_LightColor1
      \ unity_LightColor2
      \ unity_LightColor3
      \ unity_ShadowSplitSpheres
      \ unity_ShadowSplitSqRadii
      \ unity_LightShadowBias
      \ _LightSplitsNear
      \ _LightSplitsFar
      \ unity_WorldToShadow
      \ _LightShadowData
      \ unity_ShadowFadeCenterAndType
      \ unity_ObjectToWorld
      \ unity_WorldToObject
      \ unity_LODFade
      \ unity_WorldTransformParams
      \ unity_RenderingLayer
      \ unity_StereoMatrixP
      \ unity_StereoMatrixV
      \ unity_StereoMatrixInvV
      \ unity_StereoMatrixVP
      \ unity_StereoCameraProjection
      \ unity_StereoCameraInvProjection
      \ unity_StereoWorldToCamera
      \ unity_StereoCameraToWorld
      \ unity_StereoWorldSpaceCameraPos
      \ unity_StereoScaleOffset
      \ unity_StereoEyeIndices
      \ unity_StereoEyeIndex
      \ unity_StereoEyeIndex
      \ glstate_matrix_transpose_modelview0
      \ glstate_lightmodel_ambient
      \ unity_AmbientSky
      \ unity_AmbientEquator
      \ unity_AmbientGround
      \ unity_IndirectSpecColor
      \ glstate_matrix_projection
      \ unity_ShadowColor
      \ unity_FogColor
      \ unity_FogParams
      \ unity_LightmapST
      \ unity_DynamicLightmapST
      \ unity_SpecCube0
      \ unity_SpecCube0_BoxMax
      \ unity_SpecCube0_BoxMin
      \ unity_SpecCube0_ProbePosition
      \ unity_SpecCube0_HDR
      \ unity_SpecCube1
      \ unity_SpecCube1_BoxMax
      \ unity_SpecCube1_BoxMin
      \ unity_SpecCube1_ProbePosition
      \ unity_SpecCube1_HDR
      \ unity_ProbeVolumeSH
      \ unity_ProbeVolumeParams
      \ unity_ProbeVolumeWorldToObject
      \ unity_ProbeVolumeSizeInv
      \ unity_ProbeVolumeMin
      \ unity_Lightmap
      \ unity_LightmapInd
      \ unity_ShadowMask
      \ unity_DynamicLightmap
      \ unity_DynamicDirectionality
      \ unity_DynamicNormal
      \ unity_MatrixMVP
      \ unity_MatrixMV
      \ unity_MatrixTMV
      \ unity_MatrixITMV

syntax keyword shaderlabConstant true false


if !exists('shaderlab_no_unitycg')
  syntax keyword shaderlabUnityCGType
        \ appdata_base
        \ appdata_tan
        \ appdata_full
        \ appdata_img
        \ v2f_vertex_lit
        \ v2f_img

  syntax keyword shaderlabUnityCGMacro
        \ TANGENT_SPACE_ROTATION
        \ V2F_SHADOW_CASTER_NOPOS
        \ TRANSFER_SHADOW_CASTER_NOPOS_LEGACY
        \ TRANSFER_SHADOW_CASTER_NOPOS
        \ SHADOW_CASTER_FRAGMENT
        \ V2F_SHADOW_CASTER
        \ TRANSFER_SHADOW_CASTER_NORMALOFFSET
        \ TRANSFER_SHADOW_CASTER
        \ UNITY_OPAQUE_ALPHA
        \ UNITY_CALC_FOG_FACTOR_RAW
        \ UNITY_CALC_FOG_FACTOR
        \ UNITY_FOG_COORDS_PACKED
        \ UNITY_FOG_COORDS
        \ UNITY_TRANSFER_FOG
        \ UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE
        \ UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS
        \ UNITY_TRANSFER_FOG_COMBINED_WITH_EYE_VEC
        \ UNITY_FOG_LERP_COLOR
        \ UNITY_APPLY_FOG_COLOR
        \ UNITY_EXTRACT_FOG
        \ UNITY_EXTRACT_FOG_FROM_TSPACE
        \ UNITY_EXTRACT_FOG_FROM_WORLD_POS
        \ UNITY_EXTRACT_FOG_FROM_EYE_VEC
        \ UNITY_APPLY_FOG
        \ UNITY_EXTRACT_TBN_0
        \ UNITY_EXTRACT_TBN_1
        \ UNITY_EXTRACT_TBN_2
        \ UNITY_EXTRACT_TBN
        \ UNITY_EXTRACT_TBN_T
        \ UNITY_EXTRACT_TBN_N
        \ UNITY_EXTRACT_TBN_B
        \ UNITY_CORRECT_TBN_B_SIGN
        \ UNITY_RECONSTRUCT_TBN_0
        \ UNITY_RECONSTRUCT_TBN_1
        \ UNITY_RECONSTRUCT_TBN_2
        \ UNITY_RECONSTRUCT_TBN
        \ UNITY_DITHER_CROSSFADE_COORDS
        \ UNITY_DITHER_CROSSFADE_COORDS_IDX
        \ UNITY_TRANSFER_DITHER_CROSSFADE
        \ UNITY_TRANSFER_DITHER_CROSSFADE_HPOS
        \ V2F_SHADOW_COLLECTOR
        \ TRANSFER_SHADOW_COLLECTOR
        \ SAMPLE_SHADOW_COLLECTOR_SHADOW
        \ COMPUTE_SHADOW_COLLECTOR_SHADOW
        \ SHADOW_COLLECTOR_FRAGMENT
        \ UNITY_TRANSFER_DEPTH
        \ UNITY_OUTPUT_DEPTH

  syntax keyword shaderlabUnityCGMacroType
        \ V2F_SCREEN_TYPE
        \ UNITY_VPOS_TYPE

  syntax keyword shaderlabUnityCGMacroSemantics
        \ FOGC
        \ VFACE

  syntax keyword shaderlabUnityCGMacroConstant
        \ UNITY_PI
        \ UNITY_TWO_PI
        \ UNITY_FOUR_PI
        \ UNITY_INV_PI
        \ UNITY_INV_TWO_PI
        \ UNITY_INV_FOUR_PI
        \ UNITY_HALF_PI
        \ UNITY_INV_HALF_PI
        \ LIGHTMAP_RGBM_SCALE
        \ EMISSIVE_RGBM_SCALE

  syntax keyword shaderlabUnityCGMacroVariable
        \ COMPUTE_DEPTH_01
        \ COMPUTE_VIEW_NORMAL

  syntax keyword shaderlabUnityCGMacroFunction
        \ TRANSFORM_TEX
        \ TRANSFORM_UV
        \ UnityStereoScreenSpaceUVAdjust
        \ DECODE_EYEDEPTH
        \ COMPUTE_EYEDEPTH
        \ UNITY_Z_0_FAR_FROM_CLIPSPACE
        \ UNITY_APPLY_DITHER_CROSSFADE

  syntax keyword shaderlabUnityCGConstant
        \ unity_ColorSpaceGrey
        \ unity_ColorSpaceDouble
        \ unity_ColorSpaceDielectricSpec
        \ unity_ColorSpaceLuminance

  syntax keyword shaderlabUnityCGVariable
        \ unity_Lightmap_HDR
        \ unity_DynamicLightmap_HDR
        \ unity_DitherMask

  syntax keyword shaderlabUnityCGFunction
        \ IsGammaSpace
        \ GammaToLinearSpaceExact
        \ GammaToLinearSpace
        \ LinearToGammaSpaceExact
        \ LinearToGammaSpace
        \ UnityWorldToClipPos
        \ UnityViewToClipPos
        \ UnityObjectToViewPos
        \ UnityWorldToViewPos
        \ UnityObjectToWorldDir
        \ UnityWorldToObjectDir
        \ UnityObjectToWorldNormal
        \ UnityWorldSpaceLightDir
        \ WorldSpaceLightDir
        \ ObjSpaceLightDir
        \ UnityWorldSpaceViewDir
        \ WorldSpaceViewDir
        \ ObjSpaceViewDir
        \ Shade4PointLights
        \ ShadeVertexLightsFull
        \ ShadeVertexLights
        \ SHEvalLinearL0L1
        \ SHEvalLinearL2
        \ ShadeSH9
        \ ShadeSH3Order
        \ SHEvalLinearL0L1_SampleProbeVolume
        \ ShadeSH12Order
        \ VertexLight
        \ ParallaxOffset
        \ Luminance
        \ LinearRgbToLuminance
        \ UnityEncodeRGBM
        \ DecodeHDR
        \ DecodeLightmapRGBM
        \ DecodeLightmapDoubleLDR
        \ DecodeLightmap
        \ DecodeRealtimeLightmap
        \ DecodeDirectionalLightmap
        \ EncodeFloatRGBA
        \ DecodeFloatRGBA
        \ EncodeFloatRG
        \ DecodeFloatRG
        \ EncodeViewNormalStereo
        \ DecodeViewNormalStereo
        \ EncodeDepthNormal
        \ DecodeDepthNormal
        \ UnpackNormalDXT5nm
        \ UnpackNormalmapRGorAG
        \ UnpackNormal
        \ UnpackNormalWithScale
        \ Linear01Depth
        \ LinearEyeDepth
        \ UnityStereoScreenSpaceUVAdjustInternal
        \ UnityStereoScreenSpaceUVAdjustInternal
        \ TransformStereoScreenSpaceTex
        \ UnityStereoTransformScreenSpaceTex
        \ UnityStereoTransformScreenSpaceTex
        \ UnityStereoClamp
        \ MultiplyUV
        \ vert_img
        \ ComputeNonStereoScreenPos
        \ ComputeScreenPos
        \ ComputeGrabScreenPos
        \ UnityPixelSnap
        \ TransformViewToProjection
        \ TransformViewToProjection
        \ UnityEncodeCubeShadowDepth
        \ UnityDecodeCubeShadowDepth
        \ UnityClipSpaceShadowCasterPos
        \ UnityClipSpaceShadowCasterPos
        \ UnityApplyLinearShadowBias
        \ PackHeightmap
        \ UnpackHeightmap
        \ UnityApplyDitherCrossFade
endif

if !exists('shaderlab_no_unity_instancing')
  syntax keyword shaderlabUnityInstancingMacro
        \ UNITY_SUPPORT_INSTANCING
        \ UNITY_SUPPORT_STEREO_INSTANCING
        \ UNITY_INSTANCING_SUPPORT_FLEXIBLE_ARRAY_SIZE
        \ UNITY_INSTANCING_ENABLED
        \ UNITY_PROCEDURAL_INSTANCING_ENABLED
        \ UNITY_STEREO_INSTANCING_ENABLED
        \ UNITY_INSTANCING_CBUFFER_SCOPE_BEGIN
        \ UNITY_INSTANCING_CBUFFER_SCOPE_END
        \ DEFAULT_UNITY_VERTEX_INPUT_INSTANCE_ID
        \ UNITY_VERTEX_INPUT_INSTANCE_ID
        \ DEFAULT_UNITY_VERTEX_OUTPUT_STEREO
        \ DEFAULT_UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO
        \ DEFAULT_UNITY_VERTEX_OUTPUT_STEREO_EYE_INDEX
        \ DEFAULT_UNITY_INITIALIZE_OUTPUT_STEREO_EYE_INDEX
        \ DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO
        \ DEFAULT_UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
        \ UNITY_VERTEX_OUTPUT_STEREO_EYE_INDEX
        \ UNITY_INITIALIZE_OUTPUT_STEREO_EYE_INDEX
        \ UNITY_VERTEX_OUTPUT_STEREO
        \ UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO
        \ UNITY_TRANSFER_VERTEX_OUTPUT_STEREO
        \ UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
        \ UNITY_TRANSFER_INSTANCE_ID
        \ UNITY_INSTANCING_BUFFER_START
        \ UNITY_INSTANCING_BUFFER_END
        \ UNITY_DEFINE_INSTANCED_PROP
        \ UNITY_ACCESS_INSTANCED_PROP
        \ UNITY_USE_LODFADE_ARRAY
        \ UNITY_USE_RENDERINGLAYER_ARRAY
        \ UNITY_USE_LIGHTMAPST_ARRAY
        \ UNITY_USE_DYNAMICLIGHTMAPST_ARRAY
        \ UNITY_USE_SHCOEFFS_ARRAYS
  syntax keyword shaderlabUnityInstancingMacroFunction
        \ UNITY_GET_INSTANCE_ID
        \ DEFAULT_UNITY_SETUP_INSTANCE_ID
        \ UNITY_SETUP_INSTANCE_ID
        \ UnityObjectToClipPosInstanced

  syntax keyword shaderlabUnityInstancingFunction
        \ UnitySetupInstanceID
        \ UnitySetupCompoundMatrices
        \ UNITY_INSTANCING_PROCEDURAL_FUNC

  syntax keyword shaderlabUnityInstancingVariable
        \ unity_InstanceID
        \ unity_BaseInstanceID
        \ unity_InstanceCount
        \ unity_MatrixMVP_
        \ unity_MatrixMV_I
        \ unity_MatrixTMV_
        \ unity_MatrixITMV

  syntax keyword shaderlabUnityInstancingConstant
        \ UNITY_FORCE_MAX_INSTANCE_COUNT
        \ UNITY_MAX_INSTANCE_COUNT
        \ UNITY_INSTANCED_ARRAY_SIZE
        \ UNITY_WORLDTOOBJECTARRAY_CB
endif

if !exists('shaderlab_no_unity_standard_core')
  syntax keyword shaderlabUnityStandardCoreFunction
        \ NormalizePerVertexNormal
        \ NormalizePerPixelNormal
        \ MainLight
        \ AdditiveLight
        \ DummyLight
        \ ZeroIndirect
        \ WorldNormal
        \ ExtractTangentToWorldPerPixel
        \ PerPixelWorldNormal
        \ SpecularSetup
        \ RoughnessSetup
        \ MetallicSetup
        \ FragmentSetup
        \ FragmentGI
        \ OutputForward
        \ VertexGIForward
        \ vertForwardBase
        \ fragForwardBaseInternal
        \ fragForwardBase
        \ vertForwardAdd
        \ fragForwardAddInternal
        \ fragForwardAdd
        \ vertDeferred
        \ fragDeferred
        \ FragmentGI
  syntax keyword shaderlabUnityStandardCoreType
        \ FragmentCommonData
        \ VertexOutputForwardBase
        \ VertexOutputForwardAdd
        \ VertexOutputDeferred
  syntax keyword shaderlabUnityStandardCoreMacro
        \ IN_VIEWDIR4PARALLAX
        \ IN_VIEWDIR4PARALLAX_FWDADD
        \ IN_WORLDPOS
        \ IN_WORLDPOS_FWDADD
        \ IN_LIGHTDIR_FWDADD
        \ FRAGMENT_SETUP
        \ FRAGMENT_SETUP_FWDADD
  syntax keyword shaderlabUnityStandardCoreMacroFunction
        \ UNITY_SETUP_BRDF_INPUT
endif

if !exists('shaderlab_no_unity_standard_core_forward_simple')
  syntax keyword shaderlabUnityStandardCoreForwardSimpleFunction
        \ MetallicSetup_Reflectivity
        \ SpecularSetup_Reflectivity
        \ RoughnessSetup_Reflectivity
        \ TransformToTangentSpace
        \ TangentSpaceLightingInput
        \ vertForwardBaseSimple
        \ FragmentSetupSimple
        \ MainLightSimple
        \ PerVertexGrazingTerm
        \ PerVertexFresnelTerm
        \ LightDirForSpecular
        \ BRDF3DirectSimple
        \ fragForwardBaseSimpleInternal
        \ fragForwardBaseSimple
        \ vertForwardAddSimple
        \ FragmentSetupSimpleAdd
        \ LightSpaceNormal
        \ fragForwardAddSimpleInternal
        \ fragForwardAddSimple
  syntax keyword shaderlabUnityStandardCoreForwardSimpleType
        \ VertexOutputBaseSimple
        \ VertexOutputForwardAddSimple
  syntax keyword shaderlabUnityStandardCoreForwardSimpleMacroFunction
        \ JOIN
        \ JOIN2
        \ UNIFORM_REFLECTIVITY
        \ REFLECTVEC_FOR_SPECULAR
endif

if !exists('shaderlab_no_unity_standard_input')
  syntax keyword shaderlabUnityStandardInputFunction
        \ TexCoords
        \ DetailMask
        \ Albedo
        \ Alpha
        \ Occlusion
        \ SpecularGloss
        \ MetallicGloss
        \ MetallicRough
        \ Emission
        \ NormalInTangentSpace
        \ Parallax
  syntax keyword shaderlabUnityStandardInputType VertexInput
  syntax keyword shaderlabUnityStandardInputVariable
        \ _Color
        \ _Cutoff
        \ _MainTex
        \ _MainTex_ST
        \ _DetailAlbedoMap
        \ _DetailAlbedoMap_ST
        \ _BumpMap
        \ _BumpScale
        \ _DetailMask
        \ _DetailNormalMap
        \ _DetailNormalMapScale
        \ _SpecGlossMap
        \ _MetallicGlossMap
        \ _Metallic
        \ _Glossiness
        \ _GlossMapScale
        \ _OcclusionMap
        \ _OcclusionStrength
        \ _ParallaxMap
        \ _Parallax
        \ _UVSec
        \ _EmissionColor
        \ _EmissionMap
endif

if !exists('shaderlab_no_unity_standard_meta')
  syntax keyword shaderlabUnityStandardMetaType
        \ v2f_meta
  syntax keyword shaderlabUnityStandardMetaFunction
        \ vert_meta
        \ frag_meta
        \ UnityLightmappingAlbedo
endif

if !exists('shaderlab_no_unity_standard_utils')
  syntax keyword shaderlabUnityStandardUtilsFunction
        \ SpecularStrength
        \ EnergyConservationBetweenDiffuseAndSpecular
        \ OneMinusReflectivityFromMetallic
        \ DiffuseAndSpecularFromMetallic
        \ PreMultiplyAlpha
        \ ParallaxOffset1Step
        \ LerpOneTo
        \ LerpWhiteTo
        \ UnpackScaleNormalDXT5nm
        \ UnpackScaleNormalRGorAG
        \ UnpackScaleNormal
        \ BlendNormals
        \ CreateTangentToWorldPerVertex
        \ ShadeSHPerVertex
        \ ShadeSHPerPixel
        \ BoxProjectedCubemapDirection
        \ CalculateSurfaceGradient
        \ PerturbNormal
        \ CalculateSurfaceNormal
endif

" From UnityShadowLibrary.cginc
if !exists('shaderlab_no_unity_shadow_library')
  syntax keyword shaderlabUnityShadowLibraryMacroType
        \ unityShadowCoord
        \ unityShadowCoord2
        \ unityShadowCoord3
        \ unityShadowCoord4
        \ unityShadowCoord4x4

  syntax keyword shaderlabUnityShadowLibraryMacroVariable
        \ _ShadowOffsets
        \ _ShadowMapTexture_TexelSize

  syntax keyword shaderlabUnityShadowLibraryFunction
        \ UnitySampleShadowmap_PCF7x7
        \ UnitySampleShadowmap_PCF5x5
        \ UnitySampleShadowmap_PCF3x3
        \ UnityGetReceiverPlaneDepthBias
        \ UnitySampleShadowmap
        \ SampleCubeDistance
        \ LPPV_SampleProbeOcclusion
        \ UnitySampleBakedOcclusion
        \ UnityGetRawBakedOcclusions
        \ UnityMixRealtimeAndBakedShadows
        \ UnityComputeShadowFadeDistance
        \ UnityComputeShadowFade
        \ UnityGetReceiverPlaneDepthBias
        \ UnityCombineShadowcoordComponents
        \ _UnityInternalGetAreaAboveFirstTexelUnderAIsocelesRectangleTriangle
        \ _UnityInternalGetAreaPerTexel_3TexelsWideTriangleFilter
        \ _UnityInternalGetWeightPerTexel_3TexelsWideTriangleFilter
        \ _UnityInternalGetWeightPerTexel_5TexelsWideTriangleFilter
        \ _UnityInternalGetWeightPerTexel_7TexelsWideTriangleFilter
        \ UnitySampleShadowmap_PCF3x3NoHardwareSupport
        \ UnitySampleShadowmap_PCF3x3Tent
        \ UnitySampleShadowmap_PCF5x5Tent
        \ UnitySampleShadowmap_PCF7x7Tent
        \ UnitySampleShadowmap_PCF3x3Gaussian
        \ UnitySampleShadowmap_PCF5x5Gaussian
        \ UnitySampleShadowmap_PCF3x3
        \ UnitySampleShadowmap_PCF5x5
        \ UnitySampleShadowmap_PCF7x7
endif

" From AutoLight.cginc
if !exists('shaderlab_no_autolight')
  syntax keyword shaderlabAutoLightMacro
        \ SHADOW_COORDS
        \ UNITY_SHADOW_COORDS
        \ UNITY_TRANSFER_SHADOW
        \ UNITY_LIGHT_ATTENUATION
        \ DECLARE_LIGHT_COORD
        \ DECLARE_LIGHT_COORDS
        \ COMPUTE_LIGHT_COORDS
        \ LIGHT_ATTENUATION
        \ UNITY_LIGHTING_COORDS
        \ LIGHTING_COORDS
        \ UNITY_TRANSFER_LIGHTING
        \ TRANSFER_VERTEX_TO_FRAGMENT

  syntax keyword shaderlabAutoLightMacroVariable
        \ _ShadowMapTexture
        \ _LightTexture0
        \ unity_WorldToLight
        \ _LightTextureB0

  syntax keyword shaderlabAutoLightMacroFunction
        \ SHADOW_ATTENUATION
        \ UNITY_SHADOW_W
        \ UNITY_READ_SHADOW_COORDS
        \ UNITY_SHADOW_ATTENUATION

  syntax keyword shaderlabAutoLightFunction
        \ unitySampleShadow
        \ UnityComputeForwardShadows
        \ UnitySpotCookie
        \ UnitySpotAttenuate
endif

" From Lighting.cginc
if !exists('shaderlab_no_lighting')
  syntax keyword shaderlabLightingVariable
        \ UNITY_DIRBASIS
  syntax keyword shaderlabLightingFunction
        \ UnityLambertLight
        \ LightingLambert
        \ LightingLambert_Deferred
        \ LightingLambert_GI
        \ LightingLambert_PrePass
        \ UnityBlinnPhongLight
        \ LightingBlinnPhong
        \ LightingBlinnPhong_Deferred
        \ LightingBlinnPhong_GI
        \ LightingBlinnPhong_PrePass
        \ DirLightmapDiffuse
  syntax keyword shaderlabLightingType
        \ UnityTessellationFactors
endif

if !exists('shaderlab_no_unity_lighting_common')
  syntax keyword shaderlabUnityLightingCommonVariable
        \ _LightColor0
        \ _SpecColor
  syntax keyword shaderlabUnityLightingCommonType
        \ UnityLight
        \ UnityIndirect
        \ UnityGI
        \ UnityGIInput
endif

if !exists('shaderlab_no_unity_meta_pass')
  syntax keyword shaderlabUnityMacroConstant
        \ dieletricMin
        \ dieletricMax
        \ gemsMin
        \ gemsMax
        \ conductorMin
        \ conductorMax
        \ albedoMin
        \ albedoMax

  syntax keyword shaderlabUnityMetaPassVariable
        \ unity_MetaVertexControl
        \ unity_MetaFragmentControl
        \ unity_VisualizationMode
        \ _CheckPureMetal
        \ _CheckAlbedo
        \ _AlbedoCompareColor
        \ _AlbedoMinLuminance
        \ _AlbedoMaxLuminance
        \ _AlbedoHueTolerance
        \ _AlbedoSaturationTolerance
        \ unity_EditorViz_Texture
        \ unity_EditorViz_Texture_ST
        \ unity_EditorViz_UVIndex
        \ unity_EditorViz_Decode_HDR
        \ unity_EditorViz_ConvertToLinearSpace
        \ unity_EditorViz_ColorMul
        \ unity_EditorViz_ColorAdd
        \ unity_EditorViz_Exposure
        \ unity_EditorViz_LightTexture
        \ unity_EditorViz_LightTextureB
        \ unity_EditorViz_WorldToLight
        \ unity_MaterialValidateLowColor
        \ unity_MaterialValidateHighColor
        \ unity_MaterialValidatePureMetalColor
        \ unity_OneOverOutputBoost
        \ unity_MaxOutputValue
        \ unity_UseLinearSpace

  syntax keyword shaderlabUnityMetaPassFunction
        \ UnityMeta_RGBToHSVHelper
        \ UnityMeta_RGBToHSV
        \ UnityMeta_pbrAlbedo
        \ UnityMeta_pbrMetalspec
        \ UnityMetaVizUV
        \ UnityMetaVertexPosition
        \ UnityMetaFragment

  syntax keyword shaderlabUnityMetaPassType
        \ UnityMetaInput

  syntax keyword shaderlabUnityMetaPassMacroConstant
        \ EDITORVIZ_PBR_VALIDATION_ALBEDO
        \ EDITORVIZ_PBR_VALIDATION_METALSPECULAR
        \ EDITORVIZ_TEXTURE
        \ EDITORVIZ_SHOWLIGHTMASK
        \ PBR_VALIDATION_ALBEDO
        \ PBR_VALIDATION_METALSPECULAR

  syntax keyword shaderlabUnityMetaPassMacroVariable
        \ unity_EditorViz_ChannelSelect
        \ unity_EditorViz_Color
        \ unity_EditorViz_LightType
endif

" From UnityPBSLighting.cginc
if !exists('shaderlab_no_unity_pbs_lighting')
  syntax keyword shaderlabUnityPBSLightingMacro
        \ UNITY_GLOSSY_ENV_FROM_SURFACE
        \ UNITY_GI

  syntax keyword shaderlabUnityPBSLightingMacroFunction
        \ UNITY_BRDF_PBS
        \ UNITY_BRDF_GI

  syntax keyword shaderlabUnityPBSLightingFunction
        \ BRDF_Unity_Indirect
        \ LightingStandard
        \ LightingStandard_Deferred
        \ LightingStandard_GI
        \ LightingStandardSpecular
        \ LightingStandardSpecular_Deferred
        \ LightingStandardSpecular_GI

  syntax keyword shaderlabUnityPBSLightingType
        \ SurfaceOutputStandard
        \ SurfaceOutputStandardSpecular
endif

" From UnityStandardBRDF.cginc
if !exists('shaderlab_no_unity_standard_brdf')
  syntax keyword shaderlabUnityStandardBRDFFunction
        \ PerceptualRoughnessToRoughness
        \ RoughnessToPerceptualRoughness
        \ SmoothnessToRoughness
        \ SmoothnessToPerceptualRoughness
        \ Pow4
        \ Pow5
        \ FresnelTerm
        \ FresnelLerp
        \ FresnelLerpFast
        \ DisneyDiffuse
        \ SmithVisibilityTerm
        \ SmithBeckmannVisibilityTerm
        \ SmithJointGGXVisibilityTerm
        \ GGXTerm
        \ PerceptualRoughnessToSpecPower
        \ NDFBlinnPhongNormalizedTerm
        \ GetSpecPowToMip
        \ Unity_SafeNormalize
        \ BRDF1_Unity_PBS
        \ BRDF2_Unity_PBS
        \ BRDF3_Unity_PBS
        \ BRDF3_Direct
        \ BRDF3_Indirect
  syntax keyword shaderlabUnityStandardBRDFConstant
        \ k0
        \ k1
        \ fUserMaxSPow
        \ g_fMaxT
  syntax keyword shaderlabUnityStandardBRDFVariable
        \ unity_NHxRoughness
endif

" From UnityGBuffer.cginc
if !exists('shaderlab_no_unity_g_buffer')
  syntax keyword shaderlabUnityGBufferFunction
        \ UnityStandardDataToGbuffer
        \ UnityStandardDataFromGbuffer
        \ UnityStandardDataApplyWeightToGbuffer
  syntax keyword shaderlabUnityGBufferType UnityStandardData
endif

" From UnityGlobalIllumination.cginc
if !exists('shaderlab_no_unity_global_illumination')
  syntax keyword shaderlabUnityGlobalIlluminationFunction
        \ DecodeDirectionalSpecularLightmap
        \ ResetUnityLight
        \ SubtractMainLightWithRealtimeAttenuationFromLightmap
        \ ResetUnityGI
        \ UnityGI_Base
        \ UnityGI_IndirectSpecular
        \ UnityGlobalIllumination
endif

" UnityImageBasedLighting.cginc
if !exists('shaderlab_no_unity_image_based_lighting')
  syntax keyword shaderlabUnityImageBasedLightingFunction
        \ ReverseBits32
        \ RadicalInverse_VdC
        \ Hammersley2d
        \ Hash
        \ InitRandom
        \ GetLocalFrame
        \ ImportanceSampleCosDir
        \ ImportanceSampleGGXDir
        \ ImportanceSampleLambert
        \ ImportanceSampleGGX
        \ IntegrateLambertDiffuseIBLRef
        \ IntegrateDisneyDiffuseIBLRef
        \ IntegrateSpecularGGXIBLRef
        \ IntegrateDFG
        \ IntegrateLD
        \ UnityGlossyEnvironmentSetup
        \ perceptualRoughnessToMipmapLevel
        \ mipmapLevelToPerceptualRoughness
        \ Unity_GlossyEnvironment
  syntax keyword shaderlabUnityImageBasedLightingType Unity_GlossyEnvironmentData
endif

if !exists('shaderlab_no_unity_standard_util')
  syntax keyword shaderlabUnityStandardUtilFunction
        \ SpecularStrength
        \ EnergyConservationBetweenDiffuseAndSpecular
        \ OneMinusReflectivityFromMetallic
        \ DiffuseAndSpecularFromMetallic
        \ PreMultiplyAlpha
        \ ParallaxOffset1Step
        \ LerpOneTo
        \ LerpWhiteTo
        \ UnpackScaleNormalDXT5nm
        \ UnpackScaleNormalRGorAG
        \ UnpackScaleNormal
        \ BlendNormals
        \ CreateTangentToWorldPerVertex
        \ ShadeSHPerVertex
        \ ShadeSHPerPixel
        \ BoxProjectedCubemapDirection
        \ CalculateSurfaceGradient
        \ PerturbNormal
        \ CalculateSurfaceNormal
endif

if !exists('shaderlab_no_crt')
  syntax keyword shaderlabCRTType
        \ appdata_customrendertexture
        \ appdata_init_customrendertexture
        \ v2f_customrendertexture
        \ v2f_init_customrendertexture

  syntax keyword shaderlabCRTVariable
        \ CustomRenderTextureCenters
        \ CustomRenderTextureSizesAndRotations
        \ CustomRenderTexturePrimitiveIDs
        \ CustomRenderTextureParameters
        \ _CustomRenderTextureInfo
        \ _SelfTexture2D
        \ _SelfTextureCube
        \ _SelfTexture3D

  syntax keyword shaderlabCRTMacroConstant
        \ kCustomTextureBatchSize

  syntax keyword shaderlabCRTMacroVariable
        \ CustomRenderTextureUpdateSpace
        \ CustomRenderTexture3DTexcoordW
        \ CustomRenderTextureIs3D
        \ _CustomRenderTextureWidth
        \ _CustomRenderTextureHeight
        \ _CustomRenderTextureDepth
        \ _CustomRenderTextureCubeFace
        \ _CustomRenderTexture3DSlice

  syntax keyword shaderlabCRTFunction
        \ CustomRenderTextureRotate2D
        \ CustomRenderTextureComputeCubeDirection
        \ CustomRenderTextureVertexShader
        \ InitCustomRenderTextureVertexShader
endif

if !exists('shaderlab_no_vrchat')
  syntax keyword shaderlabVRChatVariable
        \ _AudioTexture
        \ _VRChatMirrorMode
        \ _VRChatCameraMode
        \ _VRChatMirrorCameraPos
endif


syntax region shaderlabString start=/\v"/ skip=/\v\\./ end=/\v"/

syntax match shaderlabDecimalNumber display '\<\%(0\|[1-9]\d\{0,9}\)\>'
syntax match shaderlabOctalNumber display '\<0[0-3]\o\{1,10\}\>'
syntax match shaderlabHexNumber display '\<0x\x\{1,8\}\>'

syntax match shaderlabFloat display '\<\d\+\.\d*\%([Ee][-+]\?\d\+\)\?[FHfh]\?\>'
syntax match shaderlabFloat display '\<\.\d\+\%([Ee][-+]\?\d\+\)\?[FHfh]\?\>'
syntax match shaderlabFloat display '\<\d\+e[-+]\?\d\+[FHfh]\?\>'

syntax match shaderlabOperator display "\v\="
syntax match shaderlabOperator display "\v\*"
syntax match shaderlabOperator display "\v/"
syntax match shaderlabOperator display "\v\+"
syntax match shaderlabOperator display "\v-"
syntax match shaderlabOperator display "\v\?"
syntax match shaderlabOperator display "\v\*\="
syntax match shaderlabOperator display "\v/\="
syntax match shaderlabOperator display "\v\+\="
syntax match shaderlabOperator display "\v-\="

syntax match shaderlabSwizzleOperator '\.\s*\<\%([xyzw]\{1,4\}\|[rgba]\{1,4\}\|[stpq]\{1,4\}\)\>'
syntax match shaderlabMatrixSwizzleOperator '\.\s*\<\%(_\%(m[0-3][0-3]\|[1-4][1-4]\)\)\{1,4\}\>'

" syntax match shaderlabCommentL '\v\/\/.*$'
syntax region shaderlabCommentL start="//" skip="\\$" end="$" keepend contains=@Spell
if exists("shaderlab_no_comment_fold")
  syntax region shaderlabComment matchgroup=shaderlabCommentStart start="/\*" end="\*/" contains=shaderlabCommentStartError,@Spell extend
  syntax region shaderlabComment matchgroup=shaderlabCommentStart start='#\s*if\s\+0' end='#\s*e\%(l\%(if\|se\)\|ndif\)' contains=shaderlabCommentStartError,@Spell extend
else
  syntax region shaderlabComment matchgroup=shaderlabCommentStart start="/\*" end="\*/" contains=shaderlabCommentStartError,@Spell fold extend
  syntax region shaderlabComment matchgroup=shaderlabCommentStart start='#\s*if\s\+0' end='#\s*e\%(l\%(if\|se\)\|ndif\)' contains=shaderlabCommentStartError,@Spell fold extend
endif
syntax match shaderlabCommentError display "\*/"
syntax match shaderlabCommentStartError display "/\*"me=e-1 contained

syntax region shaderlabPreProc
      \ start="^\s*\zs\%(%:\|#\)\s*\%(pragma\|include\|define\|undef\|if\%(n\?def\)\?\|el\%(if\|se\)\|endif\|line\|error\)\>" skip="\\$" end="$"
      \ keepend contains=ALLBUT,shaderlabConditional,shaderlabKeywordFogBlock,shaderlabKeywordStencilBlock,shaderlabKeywordMaterialBlock


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if v:version >= 508 || !exists('did_shaderlab_syntax_inits')
  if v:version < 508
    let did_shaderlab_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink shaderlabKeyword Keyword
  HiLink shaderlabKeywordAlphaTest shaderlabKeyword
  HiLink shaderlabKeywordAlphaToMask shaderlabKeyword
  HiLink shaderlabKeywordBlend shaderlabKeyword
  HiLink shaderlabKeywordBlendOp shaderlabKeyword
  HiLink shaderlabKeywordCull shaderlabKeyword
  HiLink shaderlabKeywordFog shaderlabKeyword
  HiLink shaderlabKeywordFogSub shaderlabKeyword
  HiLink shaderlabKeywordFogMode shaderlabKeyword
  HiLink shaderlabKeywordStencil shaderlabKeyword
  HiLink shaderlabKeywordStencilSub shaderlabKeyword
  HiLink shaderlabKeywordStencilComp shaderlabKeyword
  HiLink shaderlabKeywordStencilOp shaderlabKeyword
  HiLink shaderlabKeywordLighting shaderlabKeyword
  HiLink shaderlabKeywordMaterial shaderlabKeyword
  HiLink shaderlabKeywordMaterialSub shaderlabKeyword
  HiLink shaderlabKeywordSeparateSpecular shaderlabKeyword
  HiLink shaderlabKeywordZTest shaderlabKeyword
  HiLink shaderlabKeywordZWrite shaderlabKeyword
  HiLink shaderlabKeywordZClip shaderlabKeyword
  HiLink shaderlabKeywordProperties shaderlabKeyword

  HiLink shaderlabProperty StorageClass

  HiLink shaderlabStorageClass StorageClass
  HiLink shaderlabInterpolationModifier StorageClass
  HiLink shaderlabType Type
  HiLink shaderlabAttrType Type
  HiLink shaderlabAttribute PreProc
  HiLink shaderlabSemantics Typedef

  HiLink shaderlabString String
  HiLink shaderlabDecimalNumber Number
  HiLink shaderlabOctalNumber Number
  HiLink shaderlabHexNumber Number
  HiLink shaderlabFloat Float
  HiLink shaderlabOperator Operator
  HiLink shaderlabSwizzleOperator Identifier
  HiLink shaderlabMatrixSwizzleOperator Identifier

  HiLink shaderlabFunction Function
  HiLink shaderlabFunction1 Function
  HiLink shaderlabFunction2 Function
  HiLink shaderlabFunction3 Function
  HiLink shaderlabFunction4 Function
  HiLink shaderlabFunction5 Function
  HiLink shaderlabStatement Statement
  HiLink shaderlabConditional Conditional
  HiLink shaderlabRepeat Repeat
  HiLink shaderlabLabel Label
  HiLink shaderlabLangDirective PreCondit
  HiLink shaderlabPreProc PreCondit

  HiLink shaderlabVariable Identifier
  HiLink shaderlabConstant Constant

  HiLink shaderlabMacroFunction shaderlabFunction
  HiLink shaderlabMacroVariable shaderlabVariable
  HiLink shaderlabMacroConstant shaderlabConstant

  if !exists('shaderlab_no_unitycg')
    HiLink shaderlabUnityCGType shaderlabType
    HiLink shaderlabUnityCGMacro shaderlabMacro
    HiLink shaderlabUnityCGMacroType shaderlabType
    HiLink shaderlabUnityCGMacroSemantics shaderlabSemantics
    HiLink shaderlabUnityCGMacroConstant Constant
    HiLink shaderlabUnityCGMacroVariable shaderlabVariable
    HiLink shaderlabUnityCGMacroFunction shaderlabFunction
    HiLink shaderlabUnityCGConstant Constant
    HiLink shaderlabUnityCGVariable shaderlabVariable
    HiLink shaderlabUnityCGFunction shaderlabFunction
  endif
  if !exists('shaderlab_no_unity_instancing')
    HiLink shaderlabUnityInstancingMacro shaderlabMacro
    HiLink shaderlabUnityInstancingMacroFunction shaderlabMacroFunction
    HiLink shaderlabUnityInstancingFunction shaderlabFunction
    HiLink shaderlabUnityInstancingVariable shaderlabVariable
    HiLink shaderlabUnityInstancingConstant shaderlabConstant
  endif
  if !exists('shaderlab_no_unity_standard_core')
    HiLink shaderlabUnityStandardCoreFunction shaderlabFunction
    HiLink shaderlabUnityStandardCoreType shaderlabType
    HiLink shaderlabUnityStandardCoreMacro shaderlabMacro
    HiLink shaderlabUnityStandardCoreMacroFunction shaderlabMacroFunction
  endif
  if !exists('shaderlab_no_unity_standard_core_forward_simple')
    HiLink shaderlabUnityStandardCoreForwardSimpleFunction shaderlabFunction
    HiLink shaderlabUnityStandardCoreForwardSimpleType shaderlabType
    HiLink shaderlabUnityStandardCoreForwardSimpleMacroFunction shaderlabMacroFunction
  endif
  if !exists('shaderlab_no_unity_standard_input')
    HiLink shaderlabUnityStandardInputFunction shaderlabFunction
    HiLink shaderlabUnityStandardInputType shaderlabType
    HiLink shaderlabUnityStandardInputVariable shaderlabVariable
  endif
  if !exists('shaderlab_no_unity_standard_meta')
    HiLink shaderlabUnityStandardMetaType shaderlabType
    HiLink shaderlabUnityStandardMetaFunction shaderlabFunction
  endif
  if !exists('shaderlab_no_unity_standard_utils')
    HiLink shaderlabUnityStandardUtilsFunction shaderlabFunction
  endif
  if !exists('shaderlab_no_unity_shadow_library')
    HiLink shaderlabUnityShadowLibraryMacroType shaderlabType
    HiLink shaderlabUnityShadowLibraryMacroVariable shaderlabVariable
    HiLink shaderlabUnityShadowLibraryFunction shaderlabFunction
  endif
  if !exists('shaderlab_no_autolight')
    HiLink shaderlabAutoLightMacro shaderlabMacro
    HiLink shaderlabAutoLightMacroVariable shaderlabMacroVariable
    HiLink shaderlabAutoLightMacroFunction shaderlabAutoLightFunction
    HiLink shaderlabAutoLightFunction shaderlabFunction
  endif
  if !exists('shaderlab_no_lighting')
    HiLink shaderlabLightingVariable shaderlabVariable
    HiLink shaderlabLightingFunction shaderlabFunction
    HiLink shaderlabLightingType shaderlabType
  endif
  if !exists('shaderlab_no_unity_lighting_common')
    HiLink shaderlabUnityLightingCommonVariable shaderlabVariable
    HiLink shaderlabUnityLightingCommonType shaderlabType
  endif
  if !exists('shaderlab_no_unity_meta_pass')
    HiLink shaderlabUnityMacroConstant shaderlabConstant
    HiLink shaderlabUnityMetaPassVariable shaderlabVariable
    HiLink shaderlabUnityMetaPassFunction shaderlabFunction
    HiLink shaderlabUnityMetaPassType shaderlabType
    HiLink shaderlabUnityMetaPassMacroConstant shaderlabUnityMacroConstant
    HiLink shaderlabUnityMetaPassMacroVariable shaderlabMacroVariable
  endif
  if !exists('shaderlab_no_unity_pbs_lighting')
    HiLink shaderlabUnityPBSLightingMacro shaderlabFunction
    HiLink shaderlabUnityPBSLightingMacroFunction shaderlabUnityPBSLightingFunction
    HiLink shaderlabUnityPBSLightingFunction shaderlabFunction
    HiLink shaderlabUnityPBSLightingType shaderlabType
  endif
  if !exists('shaderlab_no_unity_standard_brdf')
    HiLink shaderlabUnityStandardBRDFFunction shaderlabFunction
    HiLink shaderlabUnityStandardBRDFConstant shaderlabConstant
    HiLink shaderlabUnityStandardBRDFVariable shaderlabVariable
  endif
  if !exists('shaderlab_no_unity_g_buffer')
    HiLink shaderlabUnityGBufferFunction shaderlabFunction
    HiLink shaderlabUnityGBufferType shaderlabType
  endif
  if !exists('shaderlab_no_unity_global_illumination')
    HiLink shaderlabUnityGlobalIlluminationFunction shaderlabFunction
  endif
  if !exists('shaderlab_no_unity_image_based_lighting')
    HiLink shaderlabUnityImageBasedLightingFunction shaderlabFunction
    HiLink shaderlabUnityImageBasedLightingType shaderlabType
  endif
  if !exists('shaderlab_no_unity_standard_util')
    HiLink shaderlabUnityStandardUtilFunction shaderlabFunction
  endif
  if !exists('shaderlab_no_crt')
    HiLink shaderlabCRTType shaderlabType
    HiLink shaderlabCRTVariable shaderlabVariable
    HiLink shaderlabCRTMacroConstant shaderlabConstant
    HiLink shaderlabCRTMacroVariable shaderlabCRTVariable
    HiLink shaderlabCRTFunction shaderlabFunction
  endif
  if !exists('shaderlab_no_vrchat')
    HiLink shaderlabVRChatVariable shaderlabVariable
  endif

  HiLink shaderlabMacro Macro
  HiLink shaderlabMacroConstant Constant

  HiLink shaderlabKeywordValue Constant
  HiLink shaderlabKeywordValueAlphaTest shaderlabKeywordValue
  HiLink shaderlabKeywordValueAlphaToMask shaderlabKeywordValue
  HiLink shaderlabKeywordIndexBlend shaderlabKeywordValue
  HiLink shaderlabKeywordValueBlend shaderlabKeywordValue
  HiLink shaderlabKeywordIndexBlendOp shaderlabKeywordValue
  HiLink shaderlabKeywordValueBlendOp shaderlabKeywordValue
  HiLink shaderlabKeywordValueCull shaderlabKeywordValue
  HiLink shaderlabKeywordValueFogMode shaderlabKeywordValue
  HiLink shaderlabKeywordValueStencilComp shaderlabKeywordValue
  HiLink shaderlabKeywordValueStencilOp shaderlabKeywordValue
  HiLink shaderlabKeywordValueLighting shaderlabKeywordValue
  HiLink shaderlabKeywordValueSeparateSpecular shaderlabKeywordValue
  HiLink shaderlabKeywordValueZTest shaderlabKeywordValue
  HiLink shaderlabKeywordValueZWrite shaderlabKeywordValue
  HiLink shaderlabKeywordValueZClip shaderlabKeywordValue

  HiLink shaderlabComment Comment
  HiLink shaderlabCommentL shaderlabComment
  HiLink shaderlabCommentStart shaderlabComment
  HiLink shaderlabCommentError Error
  HiLink shaderlabCommentStartError Error

  delcommand HiLink
endif

let b:current_syntax = 'shaderlab'
