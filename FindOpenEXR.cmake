
find_package(PkgConfig)
pkg_check_modules(PC_OPENEXR OpenEXR)

find_path(
    OPENEXR_INCLUDE_DIR
    NAMES ImfRgba.h
    PATHS /usr/include/OpenEXR
    HINTS ${PC_OPENEXR_INCLUDE_DIRS}
    )

# from ilmbase
find_library(ILM_HALF_LIBRARY
    NAMES Half
    PATHS /usr/lib
    HINTS ${PC_OPENEXR_LIBRARY_DIRS}
    )
find_library(ILM_IEX_LIBRARY
    NAMES Iex
    PATHS /usr/lib
    HINTS ${PC_OPENEXR_LIBRARY_DIRS}
    )
find_library(ILM_THREAD_LIBRARY
    NAMES IlmThread
    PATHS /usr/lib
    HINTS ${PC_OPENEXR_LIBRARY_DIRS}
    )
find_library(ILM_IMATH_LIBRARY
    NAMES Imath
    PATHS /usr/lib
    HINTS ${PC_OPENEXR_LIBRARY_DIRS}
    )

# from openexr
find_library(ILM_IMF_LIBRARY
    NAMES IlmImf
    PATHS /usr/lib
    )

set(OPENEXR_LIBRARIES
    ${ILM_HALF_LIBRARY}
    ${ILM_IEX_LIBRARY}
    ${ILM_THREAD_LIBRARY}
    ${ILM_IMATH_LIBRARY}
    ${ILM_IMF_LIBRARY}
    )

if (ILM_IMF_LIBRARY AND OPENEXR_INCLUDE_DIR)
    set(OPENEXR_FOUND TRUE)
else ()
    set(OPENEXR_FOUND FALSE)
endif ()

mark_as_advanced(
    OPENEXR_INCLUDE_DIR
    ILM_HALF_LIBRARY
    ILM_IEX_LIBRARY
    ILM_THREAD_LIBRARY
    ILM_IMATH_LIBRARY
    ILM_IMF_LIBRARY
    )

if (WIN32)
    set(OPENEXR_DEFINITIONS -DOPENEXR_DLL)
else (WIN32)
    set(OPENEXR_DEFINITIONS)
endif (WIN32)
