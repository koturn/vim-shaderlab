" Vim syntax file
" Language:     ShaderLab
" Maintainer:   mingchaoyan <mingchaoyan@gmail.com>
"

if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

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
      \ Fog
      \ BindChannels
      \ ColorMask
      \ Offset
      \ ColorMaterial
      \ UsePass

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

syntax keyword shaderlabKeywordBlend Blend nextgroup=shaderlabKeywordValueBlend skipwhite skipempty
syntax keyword shaderlabKeywordValueBlend
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

syntax keyword shaderlabKeywordCull Cull nextgroup=shaderlabKeywordValueCull skipwhite skipempty
syntax keyword shaderlabKeywordValueCull Back Front Off contained

syntax keyword shaderlabKeywordFog Fog nextgroup=shaderlabKeywordFogBlock skipwhite skipempty
syntax region shaderlabKeywordFogBlock start='{' skip='$' end='}' contained contains=shaderlabKeywordFogSub,shaderlabKeywordFogMode
syntax keyword shaderlabKeywordFogSub Color Density Range contained
syntax keyword shaderlabKeywordFogMode Mode contained nextgroup=shaderlabKeywordValueFogMode skipwhite skipempty
syntax keyword shaderlabKeywordValueFogMode Off Global Linear Exp Exp2 contained

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


syntax keyword shaderlabProperty Int Float Range Vector Color 2D 3D Cube

syntax keyword shaderlabStorageClass static const inline uniform

syntax match shaderlabType '\<\%(fixed\|half\|float\)\%([1-4]x[1-4]\|[2-4]\)\?\>'
syntax keyword shaderlabType void int bool SurfaceOutput samplerCUBE sampler2D sampler3D 2D struct v2f v2f_customrendertexture v2f_init_customrendertexture
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

syntax keyword shaderlabSemantics POSITION NORMAL TANGENG COLOR SV_POSITION COLOR1 COLOR2 SV_Target
syntax match shaderlabSemantics '\<TEXCOORD\d\>'

syntax keyword shaderlabFunction
      \ UnpackNormal
      \ TRANSFORM_TEX
      \ combine
      \ SetTexture
      \ UnityPixelSnap

syntax keyword shaderlabUnityCGFunction
      \ UnityObjectToClipPos
      \ UnityObjectToViewPos
      \ UnityGet2DClipping
      \ WorldSpaceViewDir
      \ ObjSpaceViewDir
      \ ParallaxOffset
      \ Luminance
      \ DecodeLightmap
      \ EncodeFloatRGBA
      \ DecodeFloatRGBA
      \ EncodeFloatRG
      \ DecodeFloatRG
      \ EncodeViewNormalStereo
      \ DecodeViewNormalStereo
      \ WorldSpaceLightDir
      \ ObjSpaceLightDir
      \ Shade4PointLights
      \ ComputeScreenPos
      \ ComputeGrabScreenPos
      \ ShadeVertexLights

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
      \ tex3Dbias
      \ tex3Dgrad
      \ tex3Dproj
      \ texCUBEbias
      \ texCUBEgrad
      \ texCUBEproj

syntax keyword shaderlabFunction3
      \ tex1Dlod
      \ tex2Dlod
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
      \ SHADER_API_D3D11
      \ SHADER_API_GLCORE
      \ SHADER_API_GLES
      \ SHADER_API_GLES3
      \ SHADER_API_METAL
      \ SHADER_API_VULKAN
      \ SHADER_API_D3D11_9X
      \ SHADER_API_PS4
      \ SHADER_API_XBOXONE
      \ UNITY_BRANCH
      \ UNITY_FLATTEN
      \ UNITY_NO_SCREENSPACE_SHADOWS
      \ UNITY_NO_LINEAR_COLORSPACE
      \ UNITY_NO_RGBM
      \ UNITY_NO_DXT5nm
      \ UNITY_FRAMEBUFFER_FETCH_AVAILABLE
      \ UNITY_USE_RGBA_FOR_POINT_SHADOWS
      \ UNITY_ATTEN_CHANNEL
      \ UNITY_HALF_TEXEL_OFFSET
      \ UNITY_UV_STARTS_AT_TOP
      \ UNITY_MIGHT_NOT_HAVE_DEPTH_Texture
      \ UNITY_PROJ_COORD
      \ UNITY_NEAR_CLIP_VALUE
      \ UNITY_VPOS_TYPE
      \ UNITY_CAN_COMPILE_TESSELLATION
      \ UNITY_INITIALIZE_OUTPUT
      \ UNITY_COMPILER_HLSL
      \ UNITY_COMPILER_HLSL2GLSL
      \ UNITY_COMPILER_CG
      \ UNITY_DECLARE_SHADOWMAP
      \ UNITY_SAMPLE_SHADOW
      \ UNITY_SAMPLE_SHADOW_PROJ
      \ UNITY_DECLARE_TEX2D
      \ UNITY_DECLARE_TEX2D_NOSAMPLER
      \ UNITY_DECLARE_TEX2DARRAY
      \ UNITY_SAMPLE_TEX2D
      \ UNITY_SAMPLE_TEX2D_SAMPLER
      \ UNITY_SAMPLE_TEX2DARRAY
      \ UNITY_SAMPLE_TEX2DARRAY_LOD
      \ UNITY_PASS_FORWARDBASE
      \ UNITY_PASS_FORWARDADD
      \ UNITY_PASS_DEFERRED
      \ UNITY_PASS_SHADOWCASTER
      \ UNITY_PASS_PREPASSBASE
      \ UNITY_PASS_PREPASSFINAL
      \ UNITY_SHADER_NO_UPGRADE
      \ UNITY_INSTANCING_BUFFER_START
      \ UNITY_DEFINE_INSTANCED_PROP
      \ UNITY_INSTANCING_BUFFER_END
      \ UNITY_SETUP_INSTANCE_ID
      \ UNITY_TRANSFER_INSTANCE_ID
      \ UNITY_ACCESS_INSTANCED_PROP
      \ UNITY_VERTEX_INPUT_INSTANCE_ID

syntax keyword shaderlabStatement if else for return break continue

syntax keyword shaderlabLangDirective CGPROGRAM CGINCLUDE ENDCG HLSLPROGRAM HLSLINCLUDE ENDHLSL

syntax keyword shaderlabVariable
      \ _WorldSpaceCameraPos
      \ _ProjectionParams
      \ _ScreenParams
      \ _ZBufferParams
      \ unity_OrthoParams
      \ unity_CameraProjection
      \ unity_CameraInvProjection
      \ unity_CameraWorldClipPlanes
      \ _Time
      \ _SinTime
      \ _CosTime
      \ unity_DeltaTime
      \ _LightColor0
      \ _WorldSpaceLightPos0
      \ _LightMatrix0
      \ unity_WorldToLight
      \ unity_4LightPosX0
      \ unity_4LightPosY0
      \ unity_4LightPosZ0
      \ unity_4LightAtten0
      \ unity_LightColor
      \ unity_WorldToShadow
      \ _LightColor
      \ unity_LightPosition
      \ unity_LightAtten
      \ unity_SpotDirection
      \ unity_Lightmap
      \ unity_LightmapST
      \ unity_AmbientSky
      \ unity_AmbientGround
      \ UNITY_LIGHTMODEL_AMBIENT
      \ unity_FogColor
      \ unity_FogParams
      \ unity_LODFade
      \ _TextureSampleAdd

syntax keyword shaderlabCRTVariable
      \ _CustomRenderTextureWidth
      \ _CustomRenderTextureHeight
      \ _CustomRenderTextureDepth
      \ _CustomRenderTextureCubeFace
      \ _CustomRenderTexture3DSlice
      \ _SelfTexture2D
      \ _SelfTextureCube
      \ _SelfTexture3D

syntax region shaderlabString start=/\v"/ skip=/\v\\./ end=/\v"/

syntax match shaderlabNumber '\<\d\+\>'

syntax match shaderlabFloat '\d\+\.\d*\%([Ee][-+]\?\d\+\)\?[FHfh]\?'
syntax match shaderlabFloat '\.\d\+\%([Ee][-+]\?\d\+\)\?[FHfh]\?'
syntax match shaderlabFloat '\d\+e[-+]\?\d\+[FHfh]\?'

syntax match shaderlabOperator "\v\="
syntax match shaderlabOperator "\v\*"
syntax match shaderlabOperator "\v/"
syntax match shaderlabOperator "\v\+"
syntax match shaderlabOperator "\v-"
syntax match shaderlabOperator "\v\?"
syntax match shaderlabOperator "\v\*\="
syntax match shaderlabOperator "\v/\="
syntax match shaderlabOperator "\v\+\="
syntax match shaderlabOperator "\v-\="

syntax match shaderlabSwizzleOperator '\.\s*\<\%([xyzw]\{1,4\}\|[rgba]\{1,4\}\|[stpq]\{1,4\}\)\>'

" syntax match shaderlabCommentL '\v\/\/.*$'
syntax region shaderlabCommentL start="//" skip="\\$" end="$" keepend contains=@Spell
if exists("c_no_comment_fold")
  syntax region shaderlabComment matchgroup=shaderlabCommentStart start="/\*" end="\*/" contains=shaderlabCommentStartError,@Spell extend
else
  syntax region shaderlabComment matchgroup=shaderlabCommentStart start="/\*" end="\*/" contains=shaderlabCommentStartError,@Spell fold extend
endif
syntax match shaderlabCommentError display "\*/"
syntax match shaderlabCommentStartError display "/\*"me=e-1 contained

syntax region shaderlabPreProc start="^\s*\zs\%(%:\|#\)\s*\%(pragma\|include\|define\|undef\|ifn\?def\|if\|elif\|else\|endif\|line\|error\)\>" skip="\\$" end="$" keepend contains=ALLBUT,shaderlabStatement


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
  HiLink shaderlabKeywordBlend shaderlabKeyword
  HiLink shaderlabKeywordCull shaderlabKeyword
  HiLink shaderlabKeywordFog shaderlabKeyword
  HiLink shaderlabKeywordFogSub shaderlabKeyword
  HiLink shaderlabKeywordFogMode shaderlabKeyword
  HiLink shaderlabKeywordLighting shaderlabKeyword
  HiLink shaderlabKeywordMaterial shaderlabKeyword
  HiLink shaderlabKeywordMaterialSub shaderlabKeyword
  HiLink shaderlabKeywordSeparateSpecular shaderlabKeyword
  HiLink shaderlabKeywordZTest shaderlabKeyword
  HiLink shaderlabKeywordZWrite shaderlabKeyword

  HiLink shaderlabProperty StorageClass

  HiLink shaderlabStorageClass StorageClass
  HiLink shaderlabType Type
  HiLink shaderlabAttrType Type
  HiLink shaderlabSemantics Typedef

  HiLink shaderlabString String
  HiLink shaderlabNumber Number
  HiLink shaderlabFloat Float
  HiLink shaderlabOperator Operator
  HiLink shaderlabSwizzleOperator Identifier

  HiLink shaderlabFunction Function
  HiLink shaderlabUnityCGFunction Function
  HiLink shaderlabFunction1 Function
  HiLink shaderlabFunction2 Function
  HiLink shaderlabFunction3 Function
  HiLink shaderlabFunction4 Function
  HiLink shaderlabFunction5 Function
  HiLink shaderlabStatement Statement
  HiLink shaderlabLangDirective PreCondit
  HiLink shaderlabPreProc PreCondit
  HiLink shaderlabVariable Identifier
  HiLink shaderlabCRTVariable Identifier

  HiLink shaderlabMacro Constant

  HiLink shaderlabKeywordValue Constant
  HiLink shaderlabKeywordValueAlphaTest shaderlabKeywordValue
  HiLink shaderlabKeywordValueBlend shaderlabKeywordValue
  HiLink shaderlabKeywordValueCull shaderlabKeywordValue
  HiLink shaderlabKeywordValueFogMode shaderlabKeywordValue
  HiLink shaderlabKeywordValueLighting shaderlabKeywordValue
  HiLink shaderlabKeywordValueSeparateSpecular shaderlabKeywordValue
  HiLink shaderlabKeywordValueZTest shaderlabKeywordValue
  HiLink shaderlabKeywordValueZWrite shaderlabKeywordValue

  HiLink shaderlabComment Comment
  HiLink shaderlabCommentL shaderlabComment
  HiLink shaderlabCommentStart shaderlabComment
  HiLink shaderlabCommentError Error
  HiLink shaderlabCommentStartError Error

  delcommand HiLink
endif

let b:current_syntax = 'shaderlab'
