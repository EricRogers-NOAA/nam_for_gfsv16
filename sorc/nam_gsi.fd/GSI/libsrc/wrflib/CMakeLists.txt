cmake_minimum_required(VERSION 2.6)
file(GLOB WRFLIB_SRC ${CMAKE_CURRENT_SOURCE_DIR}/*90)
file(GLOB WRFLIB_C_SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
set_source_files_properties( ${WRFLIB_SRC} PROPERTIES COMPILE_FLAGS ${WRFLIB_Fortran_FLAGS} )
set(WRFLIB_C_FLAGS "${WRFLIB_C_INCLUDES} -DLINUX -Dfunder -DFortranByte=char -DFortranInt=int -DFortranLlong='long long'")
set_source_files_properties( ${WRFLIB_C_SRC} PROPERTIES COMPILE_FLAGS ${WRFLIB_C_FLAGS} )
set( wrflib "WRFLIB" CACHE INTERNAL "WRF Library for I/O" )
include_directories(${NETCDF_INCLUDES})
add_library( ${wrflib} STATIC ${WRFLIB_SRC} ${WRFLIB_C_SRC} )
set_target_properties( ${wrflib} PROPERTIES Fortran_MODULE_DIRECTORY ${CMAKE_INCLUDE_OUTPUT_DIRECTORY} )
 
