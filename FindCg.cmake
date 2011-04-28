find_path(CG_INCLUDE_DIR
    NAMES Cg/cg.h
    PATHS
    /opt/nvidia-cg-toolkit/include
    )

find_library(CG_LIBRARY
    NAMES Cg 
    PATHS
    /usr/lib
    /opt/nvidia-cg-toolkit/lib
    )

find_library(
    CG_GL_LIBRARY
    NAMES CgGL
    PATHS
    /usr/lib 
    /opt/nvidia-cg-toolkit/lib
    )

if (APPLE)
    set(CG_LIBRARIES ${CG_LIBRARY})
else ()
    set(CG_LIBRARIES ${CG_LIBRARY} ${CG_GL_LIBRARY})
endif()

if (CG_LIBRARY AND CG_INCLUDE_DIR)
    set(CG_FOUND TRUE)
else (CG_LIBRARY AND CG_INCLUDE_DIR)
    set(CG_FOUND FALSE)
endif (CG_LIBRARY AND CG_INCLUDE_DIR)

mark_as_advanced(CG_INCLUDE_DIR CG_LIBRARY)
