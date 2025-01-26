" Vim syntax file for ShaderLab.
" Language: ShaderLab
" Maintainer: koturn <jeak.koutan.apple@gmail.com>

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
      \ Fallback
      \ CustomEditor
      \ BindChannels
      \ UsePass
      \ GrabPass

syntax keyword shaderlabAlphaTest AlphaTest nextgroup=shaderlabAlphaTestValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabAlphaTestValue
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

syntax match shaderlabCommandVarRef /\[\s*\w\+\s*\]/ contained

syntax keyword shaderlabAlphaToMask AlphaToMask nextgroup=shaderlabAlphaToMaskValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabAlphaToMaskValue On Off contained

syntax keyword shaderlabBind Bind nextgroup=shaderlabBindValue1 skipwhite skipempty
syntax match shaderlabBindValue1 /\c"\%(Vertex\|Normal\|Tangent\|Texcoord1\?\|Color\)"/ contained nextgroup=shaderlabBindComma skipwhite skipempty
syntax match shaderlabBindComma /,/ contained nextgroup=shaderlabBindValue2 skipwhite skipempty
syntax keyword shaderlabBindValue2 Vertex Normal Tangent Color contained
syntax match shaderlabBindValue2 /\cTexcoord\d*/ contained

syntax keyword shaderlabBlend Blend nextgroup=shaderlabBlendTarget,shaderlabBlendValue1,shaderlabBlendVarRef1 skipwhite skipempty
syntax match shaderlabBlendTarget /\<[0-7]\>/ contained nextgroup=shaderlabBlendValue1,shaderlabBlendVarRef1 skipwhite skipempty
syntax keyword shaderlabBlendValue1
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
      \ contained nextgroup=shaderlabBlendValue2,shaderlabBlendVarRef2 skipwhite skipempty
syntax match shaderlabBlendVarRef1 /\[\s*\w\+\s*\]/ contained nextgroup=shaderlabBlendValue2,shaderlabBlendVarRef2 skipwhite skipempty
syntax keyword shaderlabBlendValue2
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
      \ contained nextgroup=shaderlabBlendComma skipwhite skipempty
syntax match shaderlabBlendVarRef2 /\[\s*\w\+\s*\]/ contained nextgroup=shaderlabBlendComma skipwhite skipempty
syntax match shaderlabBlendComma /,/ contained nextgroup=shaderlabBlendValue3,shaderlabBlendVarRef3 skipwhite skipempty
syntax keyword shaderlabBlendValue3
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
      \ contained nextgroup=shaderlabBlendValue4,shaderlabBlendValue4 skipwhite skipempty
syntax match shaderlabBlendVarRef3 /\[\s*\w\+\s*\]/ contained nextgroup=shaderlabBlendValue4,shaderlabBlendValue4 skipwhite skipempty
syntax keyword shaderlabBlendValue4
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
      \ contained
syntax match shaderlabBlendVarRef4 /\[\s*\w\+\s*\]/ contained

syntax keyword shaderlabBlendOp BlendOp nextgroup=shaderlabBlendOpTarget,shaderlabBlendOpValue,shaderlabBlendOpVarRef skipwhite skipempty
syntax match shaderlabBlendOpTarget /\<[0-7]\>/ contained nextgroup=shaderlabBlendOpValue,shaderlabBlendOpVarRef skipwhite skipempty
syntax keyword shaderlabBlendOpValue
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
      \ contained nextgroup=shaderlabBlendOpComma skipwhite skipempty
syntax match shaderlabBlendOpVarRef /\[\s*\w\+\s*\]/ contained nextgroup=shaderlabBlendOpComma skipwhite skipempty
syntax match shaderlabBlendOpComma /,/ contained nextgroup=shaderlabBlendOpValue,shaderlabBlendOpVarRef skipwhite skipempty

syntax keyword shaderlabColorMask ColorMask nextgroup=shaderlabColorMaskTarget,shaderlabColorMaskValue,shaderlabCommandVarRef skipwhite skipempty
syntax match shaderlabColorMaskTarget /\<[0-7]\>/ contained nextgroup=shaderlabColorMaskValue,shaderlabCommandVarRef skipwhite skipempty
syntax match shaderlabColorMaskValue /[RGBA]\+/ contained

syntax keyword shaderlabColorMaterial ColorMaterial nextgroup=shaderlabColorMaterialValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabColorMaterialValue AmbientAndDiffuse Emission contained

syntax keyword shaderlabCull Cull nextgroup=shaderlabCullValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabCullValue Back Front Off contained

syntax keyword shaderlabFog Fog nextgroup=shaderlabFogBlock skipwhite skipempty
syntax region shaderlabFogBlock start=/{/ skip=/$/ end=/}/ contained contains=shaderlabFogSub,shaderlabFogMode
syntax keyword shaderlabFogSub Color Density Range contained
syntax keyword shaderlabFogMode Mode contained nextgroup=shaderlabFogModeValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabFogModeValue Off Global Linear Exp Exp2 contained

syntax keyword shaderlabStencil Stencil nextgroup=shaderlabStencilBlock skipwhite skipempty
syntax region shaderlabStencilBlock start=/{/ skip=/$/ end=/}/ contained contains=shaderlabStencilSub,shaderlabStencilComp,shaderlabStencilOp
syntax keyword shaderlabStencilSub Ref ReadMask WriteMask contained nextgroup=shaderlabDecimalNumber,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabStencilComp Comp CompFront CompBack contained nextgroup=shaderlabStencilCompValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabStencilCompValue Greater GEqual Less LEqual Equal NotEqual Always Never contained
syntax keyword shaderlabStencilOp Pass PassFront PassBack Fail FailFront FailBack ZFail ZFailFront ZFailBack contained nextgroup=shaderlabStencilOpValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabStencilOpValue Keep Zero Replace IncrSat DecrSat Invert IncrWrap DecrWrap contained

syntax keyword shaderlabLighting Lighting nextgroup=shaderlabLightingValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabLightingValue On Off contained

syntax keyword shaderlabLOD LOD nextgroup=shaderlabLODValue skipwhite skipempty
syntax match shaderlabLODValue /\%(\<\d\+\%(\.\d\+\)\?\|\.\d\+\)\>/ contained

syntax keyword shaderlabMaterial Material nextgroup=shaderlabMaterialBlock skipwhite skipempty
syntax region shaderlabMaterialBlock start=/{/ skip=/$/ end=/}/ contained contains=shaderlabMaterialSub
syntax keyword shaderlabMaterialSub Diffuse Ambient Specular Shininess Emission contained

syntax keyword shaderlabOffset Offset nextgroup=shaderlabOffsetFactorValue,shaderlabOffsetFactorVarRef skipwhite skipempty
syntax match shaderlabOffsetFactorValue /\%(\<\d\+\%(\.\d\+\)\?\|\.\d\+\)\>/ contained nextgroup=shaderlabOffsetComma skipwhite skipempty
syntax match shaderlabOffsetFactorVarRef /\[\s*\w\+\s*\]/ contained nextgroup=shaderlabOffsetComma skipwhite skipempty
syntax match shaderlabOffsetComma /,/ contained nextgroup=shaderlabOffsetUnitValue,shaderlabOffsetUnitVarRef skipwhite skipempty
syntax match shaderlabOffsetUnitValue /\%(\<\d\+\%(\.\d\+\)\?\|\.\d\+\)\>/ contained
syntax match shaderlabOffsetUnitVarRef /\[\s*\w\+\s*\]/ contained

syntax keyword shaderlabSeparateSpecular SeparateSpecular nextgroup=shaderlabSeparateSpecularValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabSeparateSpecularValue On Off contained

syntax keyword shaderlabZTest ZTest nextgroup=shaderlabZTestValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabZTestValue Less Greater LEqual GEqual NotEqual Always contained

syntax keyword shaderlabZWrite ZWrite nextgroup=shaderlabZWriteValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabZWriteValue On Off contained

syntax keyword shaderlabZClip ZClip nextgroup=shaderlabZClipValue,shaderlabCommandVarRef skipwhite skipempty
syntax keyword shaderlabZClipValue True False contained

syntax keyword shaderlabPropertyType Int Float Range Vector Color 2D 3D Cube

syntax case match

syntax keyword shaderlabMaterialDrawer Enum Gamma HDR HideInInspector IntRange KeywordEnum MainColor MainTexture MaterialToggle NoScaleOffset Normal PerRendererData PowerSlider Toggle ToggleOff
syntax keyword shaderlabMaterialDecorator Header Space

syntax region shaderlabString start=/"/ skip=/\\./ end=/"/

syntax match shaderlabDecimalNumber display /\<\d\+\>/
syntax match shaderlabFloat display /\%(\<\d\+\.\%(\d\+\)\?\|\.\d\+\)\>/

syntax region shaderlabCommentL start=/\/\// skip=/\\$/ end=/$/ keepend contains=@Spell
if exists('shaderlab_no_comment_fold')
  syntax region shaderlabComment matchgroup=shaderlabCommentStart start=/\/\*/ end=/\*\// contains=shaderlabCommentStartError,@Spell extend
else
  syntax region shaderlabComment matchgroup=shaderlabCommentStart start=/\/\*/ end=/\*\// contains=shaderlabCommentStartError,@Spell fold extend
endif
syntax match shaderlabCommentError display /\*\//
syntax match shaderlabCommentStartError display /\/\*/me=e-1 contained


" CG
syntax region shaderlabCgCode matchgroup=shaderlabCgDelimiter start=/\<CG\%(INCLUDE\|PROGRAM\)\>/ end=/\<ENDCG\>/ keepend
if !get(g:, 'shaderlab_no_cg', 0)
  let s:is_syntax_loaded = 0
  if get(g:, 'shaderlab_cg_as_hlsl', 0)
    try
      syntax include @shaderlabHighlightCg syntax/hlsl.vim
      let s:is_syntax_loaded = 1
    catch /^Vim\%((\a\+)\)\=:E484:/
    endtry
  else
    try
      syntax include @shaderlabHighlightCg syntax/cg.vim
      let s:is_syntax_loaded = 1
    catch /^Vim\%((\a\+)\)\=:E484:/
      try
        syntax include @shaderlabHighlightCg syntax/hlsl.vim
        let s:is_syntax_loaded = 1
      catch /^Vim\%((\a\+)\)\=:E484:/
      endtry
    endtry
  endif
  if s:is_syntax_loaded
    unlet! b:current_syntax
    syntax region shaderlabHighlightCg matchgroup=shaderlabCgDelimiter start=/\<CG\%(INCLUDE\|PROGRAM\)\>/ end=/\<ENDCG\>/ keepend contains=@shaderlabHighlightCg
  endif
  unlet s:is_syntax_loaded
endif

" HLSL
syntax region shaderlabHlslCode matchgroup=shaderlabHlslDelimiter start=/\<HLSL\%(INCLUDE\|PROGRAM\)\>/ end=/\<ENDHLSL\>/ keepend
if !get(g:, 'shaderlab_no_hlsl', 0)
  try
    syntax include @shaderlabHighlightHlsl syntax/hlsl.vim
    unlet! b:current_syntax
    syntax region shaderlabHighlightHlsl matchgroup=shaderlabHlslDelimiter start=/\<HLSL\%(INCLUDE\|PROGRAM\)\>/ end=/\<ENDHLSL\>/ keepend contains=@shaderlabHighlightHlsl
  catch /^Vim\%((\a\+)\)\=:E484:/
  endtry
endif

" GLSL
syntax region shaderlabGlslCode matchgroup=shaderlabGlslDelimiter start=/\<GLSL\%(INCLUDE\|PROGRAM\)\>/ end=/\<ENDGLSL\>/ keepend
if !get(g:, 'shaderlab_no_glsl', 0)
  try
    syntax include @shaderlabHighlightGlsl syntax/glsl.vim
    unlet! b:current_syntax
    syntax region shaderlabHighlightGlsl matchgroup=shaderlabGlslDelimiter start=/\<GLSL\%(INCLUDE\|PROGRAM\)\>/ end=/\<ENDGLSL\>/ keepend contains=@shaderlabHighlightGlsl
  catch /^Vim\%((\a\+)\)\=:E484:/
  endtry
endif


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if v:version >= 508 || !exists('did_shaderlab_syntax_inits')
  if v:version < 508
    let did_shaderlab_syntax_inits = 1
    command -nargs=+ HiLink highlight link <args>
  else
    command -nargs=+ HiLink highlight default link <args>
  endif

  HiLink shaderlabKeyword Keyword

  HiLink shaderlabAlphaTest shaderlabKeyword
  HiLink shaderlabAlphaTestValue shaderlabValue

  HiLink shaderlabAlphaToMask shaderlabKeyword
  HiLink shaderlabAlphaToMaskValue shaderlabValue

  HiLink shaderlabBind shaderlabKeyword
  HiLink shaderlabBindValue1 shaderlabString
  HiLink shaderlabBindValue2 shaderlabValue

  HiLink shaderlabBlend shaderlabKeyword
  HiLink shaderlabBlendTarget shaderlabValue
  HiLink shaderlabBlendValue1 shaderlabValue
  HiLink shaderlabBlendVarRef1 shaderlabCommandVarRef
  HiLink shaderlabBlendValue2 shaderlabValue
  HiLink shaderlabBlendVarRef2 shaderlabCommandVarRef
  HiLink shaderlabBlendValue3 shaderlabValue
  HiLink shaderlabBlendVarRef3 shaderlabCommandVarRef
  HiLink shaderlabBlendValue4 shaderlabValue
  HiLink shaderlabBlendVarRef4 shaderlabCommandVarRef

  HiLink shaderlabBlendOp shaderlabKeyword
  HiLink shaderlabBlendOpTarget shaderlabValue
  HiLink shaderlabBlendOpValue shaderlabValue
  HiLink shaderlabBlendOpVarRef shaderlabCommandVarRef

  HiLink shaderlabColorMask shaderlabKeyword
  HiLink shaderlabColorMaskTarget shaderlabValue
  HiLink shaderlabColorMaskValue shaderlabValue

  HiLink shaderlabColorMaterial shaderlabKeyword
  HiLink shaderlabColorMaterialValue shaderlabValue

  HiLink shaderlabCull shaderlabKeyword
  HiLink shaderlabCullValue shaderlabValue

  HiLink shaderlabFog shaderlabKeyword
  HiLink shaderlabFogSub shaderlabKeyword
  HiLink shaderlabFogMode shaderlabKeyword
  HiLink shaderlabFogModeValue shaderlabValue

  HiLink shaderlabStencil shaderlabKeyword
  HiLink shaderlabStencilSub shaderlabKeyword
  HiLink shaderlabStencilComp shaderlabKeyword
  HiLink shaderlabStencilCompValue shaderlabValue
  HiLink shaderlabStencilOp shaderlabKeyword
  HiLink shaderlabStencilOpValue shaderlabValue

  HiLink shaderlabLighting shaderlabKeyword
  HiLink shaderlabLightingValue shaderlabValue

  HiLink shaderlabLOD shaderlabKeyword
  HiLink shaderlabLODValue shaderlabValue

  HiLink shaderlabMaterial shaderlabKeyword
  HiLink shaderlabMaterialSub shaderlabKeyword

  HiLink shaderlabOffset shaderlabKeyword
  HiLink shaderlabOffsetFactorValue shaderlabValue
  HiLink shaderlabOffsetFactorVarRef shaderlabCommandVarRef
  HiLink shaderlabOffsetUnitValue shaderlabValue
  HiLink shaderlabOffsetUnitVarRef shaderlabCommandVarRef

  HiLink shaderlabSeparateSpecular shaderlabKeyword
  HiLink shaderlabSeparateSpecularValue shaderlabValue

  HiLink shaderlabZTest shaderlabKeyword
  HiLink shaderlabZTestValue shaderlabValue

  HiLink shaderlabZWrite shaderlabKeyword
  HiLink shaderlabZWriteValue shaderlabValue

  HiLink shaderlabZClip shaderlabKeyword
  HiLink shaderlabZClipValue shaderlabValue

  HiLink shaderlabValue Constant
  HiLink shaderlabCommandVarRef Identifier

  HiLink shaderlabPropertyType Type
  HiLink shaderlabMaterialDrawer Type
  HiLink shaderlabMaterialDecorator Type

  HiLink shaderlabString String
  HiLink shaderlabDecimalNumber Number
  HiLink shaderlabOctalNumber Number
  HiLink shaderlabHexNumber Number
  HiLink shaderlabFloat Float

  HiLink shaderlabComment Comment
  HiLink shaderlabCommentL shaderlabComment
  HiLink shaderlabCommentStart shaderlabComment
  HiLink shaderlabCommentError Error
  HiLink shaderlabCommentStartError Error

  HiLink shaderlabCgDelimiter PreCondit
  HiLink shaderlabHlslDelimiter PreCondit
  HiLink shaderlabGlslDelimiter PreCondit

  delcommand HiLink
endif

let b:current_syntax = 'shaderlab'
