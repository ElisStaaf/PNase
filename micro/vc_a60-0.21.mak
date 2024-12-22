# Microsoft Developer Studio Generated NMAKE File, Format Version 4.20
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=vc_a60 - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to vc_a60 - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "vc_a60 - Win32 Release" && "$(CFG)" != "vc_a60 - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "vc_a60.mak" CFG="vc_a60 - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "vc_a60 - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "vc_a60 - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "vc_a60 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\vc_a60.exe"

CLEAN : 
	-@erase "$(INTDIR)\A60-ptab.obj"
	-@erase "$(INTDIR)\A60-scan.obj"
	-@erase "$(INTDIR)\Bltin.obj"
	-@erase "$(INTDIR)\Check.obj"
	-@erase "$(INTDIR)\Doeval.obj"
	-@erase "$(INTDIR)\Err.obj"
	-@erase "$(INTDIR)\Eval.obj"
	-@erase "$(INTDIR)\Expr.obj"
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Mkc.obj"
	-@erase "$(INTDIR)\Run.obj"
	-@erase "$(INTDIR)\Stmt.obj"
	-@erase "$(INTDIR)\Symtab.obj"
	-@erase "$(INTDIR)\Tree.obj"
	-@erase "$(INTDIR)\Type.obj"
	-@erase "$(INTDIR)\Util.obj"
	-@erase "$(OUTDIR)\vc_a60.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/vc_a60.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=.\.
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/vc_a60.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /incremental:no /pdb:"$(OUTDIR)/vc_a60.pdb" /machine:I386\
 /out:"$(OUTDIR)/vc_a60.exe" 
LINK32_OBJS= \
	"$(INTDIR)\A60-ptab.obj" \
	"$(INTDIR)\A60-scan.obj" \
	"$(INTDIR)\Bltin.obj" \
	"$(INTDIR)\Check.obj" \
	"$(INTDIR)\Doeval.obj" \
	"$(INTDIR)\Err.obj" \
	"$(INTDIR)\Eval.obj" \
	"$(INTDIR)\Expr.obj" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\Mkc.obj" \
	"$(INTDIR)\Run.obj" \
	"$(INTDIR)\Stmt.obj" \
	"$(INTDIR)\Symtab.obj" \
	"$(INTDIR)\Tree.obj" \
	"$(INTDIR)\Type.obj" \
	"$(INTDIR)\Util.obj"

"$(OUTDIR)\vc_a60.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "vc_a60 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\vc_a60.exe"

CLEAN : 
	-@erase "$(INTDIR)\A60-ptab.obj"
	-@erase "$(INTDIR)\A60-scan.obj"
	-@erase "$(INTDIR)\Bltin.obj"
	-@erase "$(INTDIR)\Check.obj"
	-@erase "$(INTDIR)\Doeval.obj"
	-@erase "$(INTDIR)\Err.obj"
	-@erase "$(INTDIR)\Eval.obj"
	-@erase "$(INTDIR)\Expr.obj"
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Mkc.obj"
	-@erase "$(INTDIR)\Run.obj"
	-@erase "$(INTDIR)\Stmt.obj"
	-@erase "$(INTDIR)\Symtab.obj"
	-@erase "$(INTDIR)\Tree.obj"
	-@erase "$(INTDIR)\Type.obj"
	-@erase "$(INTDIR)\Util.obj"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\vc_a60.exe"
	-@erase "$(OUTDIR)\vc_a60.ilk"
	-@erase "$(OUTDIR)\vc_a60.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/vc_a60.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.\.
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/vc_a60.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /incremental:yes /pdb:"$(OUTDIR)/vc_a60.pdb" /debug\
 /machine:I386 /out:"$(OUTDIR)/vc_a60.exe" 
LINK32_OBJS= \
	"$(INTDIR)\A60-ptab.obj" \
	"$(INTDIR)\A60-scan.obj" \
	"$(INTDIR)\Bltin.obj" \
	"$(INTDIR)\Check.obj" \
	"$(INTDIR)\Doeval.obj" \
	"$(INTDIR)\Err.obj" \
	"$(INTDIR)\Eval.obj" \
	"$(INTDIR)\Expr.obj" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\Mkc.obj" \
	"$(INTDIR)\Run.obj" \
	"$(INTDIR)\Stmt.obj" \
	"$(INTDIR)\Symtab.obj" \
	"$(INTDIR)\Tree.obj" \
	"$(INTDIR)\Type.obj" \
	"$(INTDIR)\Util.obj"

"$(OUTDIR)\vc_a60.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Target

# Name "vc_a60 - Win32 Release"
# Name "vc_a60 - Win32 Debug"

!IF  "$(CFG)" == "vc_a60 - Win32 Release"

!ELSEIF  "$(CFG)" == "vc_a60 - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Util.c"
DEP_CPP_UTIL_=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\expr.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_UTIL_=\
	"..\config.h"\
	

"$(INTDIR)\Util.obj" : $(SOURCE) $(DEP_CPP_UTIL_) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\A60-scan.c"
DEP_CPP_A60_S=\
	"..\a60-ptab.h"\
	"..\a60-scan.h"\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\expr.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_A60_S=\
	"..\config.h"\
	

"$(INTDIR)\A60-scan.obj" : $(SOURCE) $(DEP_CPP_A60_S) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Bltin.c"
DEP_CPP_BLTIN=\
	"..\a60-mkc.inc"\
	"..\a60.h"\
	"..\block.h"\
	"..\bltin.h"\
	"..\comm.h"\
	"..\conv.h"\
	"..\eval.h"\
	"..\expr.h"\
	"..\run.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_BLTIN=\
	"..\config.h"\
	

"$(INTDIR)\Bltin.obj" : $(SOURCE) $(DEP_CPP_BLTIN) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Check.c"
DEP_CPP_CHECK=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\expr.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_CHECK=\
	"..\config.h"\
	

"$(INTDIR)\Check.obj" : $(SOURCE) $(DEP_CPP_CHECK) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Doeval.c"
DEP_CPP_DOEVA=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\conv.h"\
	"..\eval.h"\
	"..\expr.h"\
	"..\run.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_DOEVA=\
	"..\config.h"\
	

"$(INTDIR)\Doeval.obj" : $(SOURCE) $(DEP_CPP_DOEVA) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Err.c"
DEP_CPP_ERR_C=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\expr.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	
NODEP_CPP_ERR_C=\
	"..\config.h"\
	

"$(INTDIR)\Err.obj" : $(SOURCE) $(DEP_CPP_ERR_C) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Eval.c"
DEP_CPP_EVAL_=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\conv.h"\
	"..\eval.h"\
	"..\expr.h"\
	"..\run.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_EVAL_=\
	"..\config.h"\
	

"$(INTDIR)\Eval.obj" : $(SOURCE) $(DEP_CPP_EVAL_) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Expr.c"
DEP_CPP_EXPR_=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\expr.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_EXPR_=\
	"..\config.h"\
	

"$(INTDIR)\Expr.obj" : $(SOURCE) $(DEP_CPP_EXPR_) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Main.c"
DEP_CPP_MAIN_=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\eval.h"\
	"..\expr.h"\
	"..\mkc.h"\
	"..\run.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	"..\version.h"\
	
NODEP_CPP_MAIN_=\
	"..\config.h"\
	

"$(INTDIR)\Main.obj" : $(SOURCE) $(DEP_CPP_MAIN_) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Mkc.c"
DEP_CPP_MKC_C=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\expr.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	"..\version.h"\
	
NODEP_CPP_MKC_C=\
	"..\config.h"\
	

"$(INTDIR)\Mkc.obj" : $(SOURCE) $(DEP_CPP_MKC_C) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Run.c"
DEP_CPP_RUN_C=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\conv.h"\
	"..\eval.h"\
	"..\expr.h"\
	"..\run.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_RUN_C=\
	"..\config.h"\
	

"$(INTDIR)\Run.obj" : $(SOURCE) $(DEP_CPP_RUN_C) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Stmt.c"
DEP_CPP_STMT_=\
	"..\block.h"\
	"..\comm.h"\
	"..\eval.h"\
	"..\expr.h"\
	"..\run.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_STMT_=\
	"..\config.h"\
	

"$(INTDIR)\Stmt.obj" : $(SOURCE) $(DEP_CPP_STMT_) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Symtab.c"
DEP_CPP_SYMTA=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\eval.h"\
	"..\expr.h"\
	"..\run.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_SYMTA=\
	"..\config.h"\
	

"$(INTDIR)\Symtab.obj" : $(SOURCE) $(DEP_CPP_SYMTA) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Tree.c"
DEP_CPP_TREE_=\
	"..\a60.h"\
	"..\block.h"\
	"..\comm.h"\
	"..\eval.h"\
	"..\expr.h"\
	"..\run.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_TREE_=\
	"..\config.h"\
	

"$(INTDIR)\Tree.obj" : $(SOURCE) $(DEP_CPP_TREE_) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\Type.c"
DEP_CPP_TYPE_=\
	"..\type.h"\
	

"$(INTDIR)\Type.obj" : $(SOURCE) $(DEP_CPP_TYPE_) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE="\Tmp\A60-0.21\A60-ptab.c"
DEP_CPP_A60_P=\
	"..\a60.h"\
	"..\block.h"\
	"..\bltin.h"\
	"..\comm.h"\
	"..\eval.h"\
	"..\expr.h"\
	"..\run.h"\
	"..\symtab.h"\
	"..\tree.h"\
	"..\type.h"\
	"..\util.h"\
	
NODEP_CPP_A60_P=\
	"..\config.h"\
	

"$(INTDIR)\A60-ptab.obj" : $(SOURCE) $(DEP_CPP_A60_P) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
# End Target
# End Project
################################################################################
