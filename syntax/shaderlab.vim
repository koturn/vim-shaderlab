" Vim syntax file
" Language:     ShaderLab
" Maintainer:   mingchaoyan <mingchaoyan@gmail.com>
"

if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syntax keyword shaderlabKeyword Shader
      \ Category
      \ Properties
      \ SubShader
      \ Name
      \ Pass
      \ Tags
      \ LOD
      \ Fallback
      \ Material
      \ Lighting
      \ Cull
      \ ZTest
      \ ZWrite
      \ Fog
      \ AlphaTest
      \ BindChannels
      \ Blend
      \ ColorMask
      \ Offset
      \ SeparateSpecular
      \ ColorMaterial
      \ UsePass

syntax match shaderlabKeywordValue /\<O\%(n\|ff\)\>/
syntax match shaderlabKeywordValue '\%(Less\|Greater\|LEqual\|GEqual\|Equal\|NotEqual\|Always\)'

syntax keyword shaderlabProperty Int Float Range Vector Color 2D 3D Cube

syntax keyword shaderlabStorageClass static const

syntax match shaderlabType '\%(fixed\|half\|float\)\%([1-4]x[1-4]\|[2-4]\)\?'
syntax keyword shaderlabType void int bool SurfaceOutput samplerCUBE sampler2D sampler3D 2D struct v2f_customrendertexture

syntax keyword shaderlabSemantics POSITION NORMAL TANGENG COLOR SV_POSITION COLOR1 COLOR2 SV_Target
syntax match shaderlabSemantics 'TEXCOORD\d'

syntax keyword shaderlabFunction length
      \ cross
      \ pow
      \ tex2D
      \ UnpackNormal
      \ saturate
      \ dot
      \ normalize
      \ clip
      \ frac
      \ mul
      \ TRANSFORM_TEX
      \ SetTexture
      \ combine
      \ UnityPixelSnap
      \ abs
      \ min
      \ max
      \ pow
      \ lerp
      \ fmod
      \ step
      \ clamp
      \ sin
      \ cos
      \ floor
      \ ceil
      \ smoothstep

syntax keyword shaderlabStatement if else for return break continue

syntax keyword shaderlabCGProgram CGPROGRAM ENDCG

syntax keyword shaderlabVariable _WorldSpaceCameraPos
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
      \ unity_WorldToLight
      \ unity_4LightPosX0
      \ unity_4LightPosY0
      \ unity_4LightPosZ0
      \ unity_4LightAtten0
      \ unity_LightColor
      \ unity_WorldToShadow
      \ _LightColor
      \ unity_WorldToLight
      \ unity_WorldToShadow
      \ unity_LightColor
      \ unity_LightPosition
      \ unity_LightAtten
      \ unity_SpotDirection
      \ unity_Lightmap
      \ unity_LightmapST
      \ unity_AmbientSky
      \ unity_AmbientSky
      \ unity_AmbientGround
      \ UNITY_LIGHTMODEL_AMBIENT
      \ unity_FogColor
      \ unity_FogParams
      \ unity_LODFade
      \ _TextureSampleAdd

syntax keyword shaderlabCRTVariable _CustomRenderTextureWidth
      \ _CustomRenderTextureHeight
      \ _CustomRenderTextureDepth
      \ _CustomRenderTextureCubeFace
      \ _CustomRenderTexture3DSlice
      \ _SelfTexture2D
      \ _SelfTextureCube
      \ _SelfTexture3D

syntax region shaderlabString start=/\v"/ skip=/\v\\./ end=/\v"/

syntax match shaderlabNumber '\<\d\+\>'
syntax match shaderlabFloat '\<\d\+\.\d\+\>'

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

syntax match shaderlabComment '\v\/\/.*$'

syn region shaderlabPreProc start="^\s*\(%:\|#\)\s*\(pragma\>\|include\|define\>\)" skip="\\$" end="$" keepend contains=ALLBUT

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
  HiLink shaderlabProperty StorageClass

  HiLink shaderlabStorageClass StorageClass
  HiLink shaderlabType Type
  HiLink shaderlabSemantics Typedef

  HiLink shaderlabString String
  HiLink shaderlabNumber Number
  HiLink shaderlabFloat Float
  HiLink shaderlabOperator Operator

  HiLink shaderlabFunction Function
  HiLink shaderlabStatement Statement
  HiLink shaderlabCGProgram PreCondit
  HiLink shaderlabComment Comment
  HiLink shaderlabPreProc PreCondit
  HiLink shaderlabVariable Identifier
  HiLink shaderlabCRTVariable Identifier

  HiLink shaderlabKeywordValue Constant

  delcommand HiLink
endif

let b:current_syntax = 'shaderlab'
