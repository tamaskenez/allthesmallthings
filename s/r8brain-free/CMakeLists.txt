cmake_minimum_required(VERSION 3.20)
project(r8brain-free)

if(NOT ROOT)
	message(FATAL_ERROR "ROOT must be set to the r8brain-free root directory")
endif()

set(CMAKE_DEBUG_POSTFIX d)

add_library(r8brain-free STATIC
	${ROOT}/CDSPBlockConvolver.h
	${ROOT}/CDSPFIRFilter.h
	${ROOT}/CDSPFracInterpolator.h
	${ROOT}/CDSPHBDownsampler.h
	${ROOT}/CDSPHBUpsampler.h
	${ROOT}/CDSPHBUpsampler.inc
	${ROOT}/CDSPProcessor.h
	${ROOT}/CDSPRealFFT.h
	${ROOT}/CDSPResampler.h
	${ROOT}/CDSPSincFilterGen.h
	${ROOT}/r8bbase.h
	${ROOT}/r8bconf.h

	${ROOT}/r8bbase.cpp
	
	${ROOT}/pffft_double/pffft_double.c
	${ROOT}/pffft_double/pffft_double.h
	${ROOT}/pffft_double/pffft_priv_impl.h
	${ROOT}/pffft_double/simd/pf_avx_double.h
	${ROOT}/pffft_double/simd/pf_double.h
	${ROOT}/pffft_double/simd/pf_neon_double.h
	${ROOT}/pffft_double/simd/pf_neon_double_from_avx.h
	${ROOT}/pffft_double/simd/pf_scalar_double.h
	${ROOT}/pffft_double/simd/pf_sse2_double.h
)

target_compile_definitions(r8brain-free PUBLIC R8B_PFFFT_DOUBLE=1)