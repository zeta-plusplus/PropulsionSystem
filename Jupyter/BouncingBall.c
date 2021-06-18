/* Main Simulation File */

#if defined(__cplusplus)
extern "C" {
#endif

#include "BouncingBall_model.h"
#include "simulation/solver/events.h"

#define prefixedName_performSimulation BouncingBall_performSimulation
#define prefixedName_updateContinuousSystem BouncingBall_updateContinuousSystem
#include <simulation/solver/perform_simulation.c.inc>

#define prefixedName_performQSSSimulation BouncingBall_performQSSSimulation
#include <simulation/solver/perform_qss_simulation.c.inc>


/* dummy VARINFO and FILEINFO */
const FILE_INFO dummyFILE_INFO = omc_dummyFileInfo;
const VAR_INFO dummyVAR_INFO = omc_dummyVarInfo;

int BouncingBall_input_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int BouncingBall_input_function_init(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int BouncingBall_input_function_updateStartValues(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int BouncingBall_inputNames(DATA *data, char ** names){
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int BouncingBall_data_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  TRACE_POP
  return 0;
}

int BouncingBall_dataReconciliationInputNames(DATA *data, char ** names){
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int BouncingBall_output_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int BouncingBall_setc_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


/*
equation index: 14
type: SIMPLE_ASSIGN
impact = h <= 0.0
*/
void BouncingBall_eqFunction_14(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,14};
  modelica_boolean tmp0;
  RELATIONHYSTERESIS(tmp0, data->localData[0]->realVars[0] /* h STATE(1,v) */, 0.0, 0, LessEq);
  data->localData[0]->booleanVars[4] /* impact DISCRETE */ = tmp0;
  TRACE_POP
}
/*
equation index: 15
type: SIMPLE_ASSIGN
foo = if impact then 1 else 2
*/
void BouncingBall_eqFunction_15(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,15};
  data->localData[0]->integerVars[0] /* foo DISCRETE */ = (data->localData[0]->booleanVars[4] /* impact DISCRETE */?((modelica_integer) 1):((modelica_integer) 2));
  TRACE_POP
}
/*
equation index: 16
type: SIMPLE_ASSIGN
$whenCondition1 = impact and v <= 0.0
*/
void BouncingBall_eqFunction_16(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,16};
  modelica_boolean tmp1;
  RELATIONHYSTERESIS(tmp1, data->localData[0]->realVars[1] /* v STATE(1) */, 0.0, 1, LessEq);
  data->localData[0]->booleanVars[0] /* $whenCondition1 DISCRETE */ = (data->localData[0]->booleanVars[4] /* impact DISCRETE */ && tmp1);
  TRACE_POP
}
/*
equation index: 17
type: SIMPLE_ASSIGN
$whenCondition2 = impact
*/
void BouncingBall_eqFunction_17(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,17};
  data->localData[0]->booleanVars[1] /* $whenCondition2 DISCRETE */ = data->localData[0]->booleanVars[4] /* impact DISCRETE */;
  TRACE_POP
}
/*
equation index: 18
type: WHEN

when {$whenCondition2, $whenCondition1} then
  v_new = if impact and not pre(impact) then (-e) * pre(v) else 0.0;
end when;
*/
void BouncingBall_eqFunction_18(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,18};
  if((data->localData[0]->booleanVars[1] /* $whenCondition2 DISCRETE */ && !data->simulationInfo->booleanVarsPre[1] /* $whenCondition2 DISCRETE */ /* edge */) || (data->localData[0]->booleanVars[0] /* $whenCondition1 DISCRETE */ && !data->simulationInfo->booleanVarsPre[0] /* $whenCondition1 DISCRETE */ /* edge */))
  {
    data->localData[0]->realVars[4] /* v_new DISCRETE */ = ((data->localData[0]->booleanVars[4] /* impact DISCRETE */ && (!data->simulationInfo->booleanVarsPre[4] /* impact DISCRETE */))?((-data->simulationInfo->realParameter[0] /* e PARAM */)) * (data->simulationInfo->realVarsPre[1] /* v STATE(1) */):0.0);
  }
  TRACE_POP
}
/*
equation index: 19
type: WHEN

when {$whenCondition2, $whenCondition1} then
  flying = v_new > 0.0;
end when;
*/
void BouncingBall_eqFunction_19(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,19};
  modelica_boolean tmp2;
  if((data->localData[0]->booleanVars[1] /* $whenCondition2 DISCRETE */ && !data->simulationInfo->booleanVarsPre[1] /* $whenCondition2 DISCRETE */ /* edge */) || (data->localData[0]->booleanVars[0] /* $whenCondition1 DISCRETE */ && !data->simulationInfo->booleanVarsPre[0] /* $whenCondition1 DISCRETE */ /* edge */))
  {
    tmp2 = Greater(data->localData[0]->realVars[4] /* v_new DISCRETE */,0.0);
    data->localData[0]->booleanVars[3] /* flying DISCRETE */ = tmp2;
  }
  TRACE_POP
}
/*
equation index: 20
type: SIMPLE_ASSIGN
$DER.v = if flying then -g else 0.0
*/
void BouncingBall_eqFunction_20(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,20};
  data->localData[0]->realVars[3] /* der(v) STATE_DER */ = (data->localData[0]->booleanVars[3] /* flying DISCRETE */?(-data->simulationInfo->realParameter[1] /* g PARAM */):0.0);
  TRACE_POP
}
/*
equation index: 21
type: SIMPLE_ASSIGN
$DER.h = v
*/
void BouncingBall_eqFunction_21(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,21};
  data->localData[0]->realVars[2] /* der(h) STATE_DER */ = data->localData[0]->realVars[1] /* v STATE(1) */;
  TRACE_POP
}
/*
equation index: 22
type: SIMPLE_ASSIGN
$whenCondition3 = h <= 0.0 and v <= 0.0
*/
void BouncingBall_eqFunction_22(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,22};
  modelica_boolean tmp3;
  modelica_boolean tmp4;
  RELATIONHYSTERESIS(tmp3, data->localData[0]->realVars[0] /* h STATE(1,v) */, 0.0, 0, LessEq);
  RELATIONHYSTERESIS(tmp4, data->localData[0]->realVars[1] /* v STATE(1) */, 0.0, 1, LessEq);
  data->localData[0]->booleanVars[2] /* $whenCondition3 DISCRETE */ = (tmp3 && tmp4);
  TRACE_POP
}
/*
equation index: 23
type: WHEN

when {$whenCondition2, $whenCondition3} then
  reinit(v,  v_new);
end when;
*/
void BouncingBall_eqFunction_23(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,23};
  if((data->localData[0]->booleanVars[1] /* $whenCondition2 DISCRETE */ && !data->simulationInfo->booleanVarsPre[1] /* $whenCondition2 DISCRETE */ /* edge */) || (data->localData[0]->booleanVars[2] /* $whenCondition3 DISCRETE */ && !data->simulationInfo->booleanVarsPre[2] /* $whenCondition3 DISCRETE */ /* edge */))
  {
    data->localData[0]->realVars[1] /* v STATE(1) */ = data->localData[0]->realVars[4] /* v_new DISCRETE */;
    infoStreamPrint(LOG_EVENTS, 0, "reinit v = %g", data->localData[0]->realVars[1] /* v STATE(1) */);
    data->simulationInfo->needToIterate = 1;
  }
  TRACE_POP
}

OMC_DISABLE_OPT
int BouncingBall_functionDAE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  int equationIndexes[1] = {0};
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_DAE);
#endif

  data->simulationInfo->needToIterate = 0;
  data->simulationInfo->discreteCall = 1;
  BouncingBall_functionLocalKnownVars(data, threadData);
  BouncingBall_eqFunction_14(data, threadData);

  BouncingBall_eqFunction_15(data, threadData);

  BouncingBall_eqFunction_16(data, threadData);

  BouncingBall_eqFunction_17(data, threadData);

  BouncingBall_eqFunction_18(data, threadData);

  BouncingBall_eqFunction_19(data, threadData);

  BouncingBall_eqFunction_20(data, threadData);

  BouncingBall_eqFunction_21(data, threadData);

  BouncingBall_eqFunction_22(data, threadData);

  BouncingBall_eqFunction_23(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_DAE);
#endif
  TRACE_POP
  return 0;
}


int BouncingBall_functionLocalKnownVars(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


/* forwarded equations */
extern void BouncingBall_eqFunction_14(DATA* data, threadData_t *threadData);
extern void BouncingBall_eqFunction_16(DATA* data, threadData_t *threadData);
extern void BouncingBall_eqFunction_17(DATA* data, threadData_t *threadData);
extern void BouncingBall_eqFunction_20(DATA* data, threadData_t *threadData);
extern void BouncingBall_eqFunction_21(DATA* data, threadData_t *threadData);

static void functionODE_system0(DATA *data, threadData_t *threadData)
{
    BouncingBall_eqFunction_14(data, threadData);

    BouncingBall_eqFunction_16(data, threadData);

    BouncingBall_eqFunction_17(data, threadData);

    BouncingBall_eqFunction_20(data, threadData);

    BouncingBall_eqFunction_21(data, threadData);
}

int BouncingBall_functionODE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_FUNCTION_ODE);
#endif

  
  data->simulationInfo->callStatistics.functionODE++;
  
  BouncingBall_functionLocalKnownVars(data, threadData);
  functionODE_system0(data, threadData);

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_FUNCTION_ODE);
#endif

  TRACE_POP
  return 0;
}

/* forward the main in the simulation runtime */
extern int _main_SimulationRuntime(int argc, char**argv, DATA *data, threadData_t *threadData);

#include "BouncingBall_12jac.h"
#include "BouncingBall_13opt.h"

struct OpenModelicaGeneratedFunctionCallbacks BouncingBall_callback = {
   (int (*)(DATA *, threadData_t *, void *)) BouncingBall_performSimulation,    /* performSimulation */
   (int (*)(DATA *, threadData_t *, void *)) BouncingBall_performQSSSimulation,    /* performQSSSimulation */
   BouncingBall_updateContinuousSystem,    /* updateContinuousSystem */
   BouncingBall_callExternalObjectDestructors,    /* callExternalObjectDestructors */
   NULL,    /* initialNonLinearSystem */
   NULL,    /* initialLinearSystem */
   NULL,    /* initialMixedSystem */
   #if !defined(OMC_NO_STATESELECTION)
   BouncingBall_initializeStateSets,
   #else
   NULL,
   #endif    /* initializeStateSets */
   BouncingBall_initializeDAEmodeData,
   BouncingBall_functionODE,
   BouncingBall_functionAlgebraics,
   BouncingBall_functionDAE,
   BouncingBall_functionLocalKnownVars,
   BouncingBall_input_function,
   BouncingBall_input_function_init,
   BouncingBall_input_function_updateStartValues,
   BouncingBall_data_function,
   BouncingBall_output_function,
   BouncingBall_setc_function,
   BouncingBall_function_storeDelayed,
   BouncingBall_updateBoundVariableAttributes,
   BouncingBall_functionInitialEquations,
   1, /* useHomotopy - 0: local homotopy (equidistant lambda), 1: global homotopy (equidistant lambda), 2: new global homotopy approach (adaptive lambda), 3: new local homotopy approach (adaptive lambda)*/
   NULL,
   BouncingBall_functionRemovedInitialEquations,
   BouncingBall_updateBoundParameters,
   BouncingBall_checkForAsserts,
   BouncingBall_function_ZeroCrossingsEquations,
   BouncingBall_function_ZeroCrossings,
   BouncingBall_function_updateRelations,
   BouncingBall_zeroCrossingDescription,
   BouncingBall_relationDescription,
   BouncingBall_function_initSample,
   BouncingBall_INDEX_JAC_A,
   BouncingBall_INDEX_JAC_B,
   BouncingBall_INDEX_JAC_C,
   BouncingBall_INDEX_JAC_D,
   BouncingBall_INDEX_JAC_F,
   BouncingBall_initialAnalyticJacobianA,
   BouncingBall_initialAnalyticJacobianB,
   BouncingBall_initialAnalyticJacobianC,
   BouncingBall_initialAnalyticJacobianD,
   BouncingBall_initialAnalyticJacobianF,
   BouncingBall_functionJacA_column,
   BouncingBall_functionJacB_column,
   BouncingBall_functionJacC_column,
   BouncingBall_functionJacD_column,
   BouncingBall_functionJacF_column,
   BouncingBall_linear_model_frame,
   BouncingBall_linear_model_datarecovery_frame,
   BouncingBall_mayer,
   BouncingBall_lagrange,
   BouncingBall_pickUpBoundsForInputsInOptimization,
   BouncingBall_setInputData,
   BouncingBall_getTimeGrid,
   BouncingBall_symbolicInlineSystem,
   BouncingBall_function_initSynchronous,
   BouncingBall_function_updateSynchronous,
   BouncingBall_function_equationsSynchronous,
   BouncingBall_inputNames,
   BouncingBall_dataReconciliationInputNames,
   NULL,
   NULL,
   NULL,
   -1

};

#define _OMC_LIT_RESOURCE_0_name_data "BouncingBall"
#define _OMC_LIT_RESOURCE_0_dir_data "/usr/share/doc/omc/testmodels"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_0_name,12,_OMC_LIT_RESOURCE_0_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir,29,_OMC_LIT_RESOURCE_0_dir_data);

#define _OMC_LIT_RESOURCE_1_name_data "Complex"
#define _OMC_LIT_RESOURCE_1_dir_data "/usr/lib/omlibrary"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_1_name,7,_OMC_LIT_RESOURCE_1_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir,18,_OMC_LIT_RESOURCE_1_dir_data);

#define _OMC_LIT_RESOURCE_2_name_data "Modelica"
#define _OMC_LIT_RESOURCE_2_dir_data "/usr/lib/omlibrary/Modelica 3.2.3"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_2_name,8,_OMC_LIT_RESOURCE_2_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir,33,_OMC_LIT_RESOURCE_2_dir_data);

#define _OMC_LIT_RESOURCE_3_name_data "ModelicaServices"
#define _OMC_LIT_RESOURCE_3_dir_data "/usr/lib/omlibrary/ModelicaServices 3.2.3"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_name,16,_OMC_LIT_RESOURCE_3_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir,41,_OMC_LIT_RESOURCE_3_dir_data);

static const MMC_DEFSTRUCTLIT(_OMC_LIT_RESOURCES,8,MMC_ARRAY_TAG) {MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir)}};
void BouncingBall_setupDataStruc(DATA *data, threadData_t *threadData)
{
  assertStreamPrint(threadData,0!=data, "Error while initialize Data");
  threadData->localRoots[LOCAL_ROOT_SIMULATION_DATA] = data;
  data->callback = &BouncingBall_callback;
  OpenModelica_updateUriMapping(threadData, MMC_REFSTRUCTLIT(_OMC_LIT_RESOURCES));
  data->modelData->modelName = "BouncingBall";
  data->modelData->modelFilePrefix = "BouncingBall";
  data->modelData->resultFileName = NULL;
  data->modelData->modelDir = "/usr/share/doc/omc/testmodels";
  data->modelData->modelGUID = "{2b8695d3-1042-4541-b3be-e802cd000bbd}";
  #if defined(OPENMODELICA_XML_FROM_FILE_AT_RUNTIME)
  data->modelData->initXMLData = NULL;
  data->modelData->modelDataXml.infoXMLData = NULL;
  #else
  #if defined(_MSC_VER) /* handle joke compilers */
  {
  /* for MSVC we encode a string like char x[] = {'a', 'b', 'c', '\0'} */
  /* because the string constant limit is 65535 bytes */
  static const char contents_init[] =
    #include "BouncingBall_init.c"
    ;
  static const char contents_info[] =
    #include "BouncingBall_info.c"
    ;
    data->modelData->initXMLData = contents_init;
    data->modelData->modelDataXml.infoXMLData = contents_info;
  }
  #else /* handle real compilers */
  data->modelData->initXMLData =
  #include "BouncingBall_init.c"
    ;
  data->modelData->modelDataXml.infoXMLData =
  #include "BouncingBall_info.c"
    ;
  #endif /* defined(_MSC_VER) */
  #endif /* defined(OPENMODELICA_XML_FROM_FILE_AT_RUNTIME) */
  data->modelData->runTestsuite = 0;
  
  data->modelData->nStates = 2;
  data->modelData->nVariablesReal = 5;
  data->modelData->nDiscreteReal = 1;
  data->modelData->nVariablesInteger = 1;
  data->modelData->nVariablesBoolean = 5;
  data->modelData->nVariablesString = 0;
  data->modelData->nParametersReal = 2;
  data->modelData->nParametersInteger = 0;
  data->modelData->nParametersBoolean = 0;
  data->modelData->nParametersString = 0;
  data->modelData->nInputVars = 0;
  data->modelData->nOutputVars = 0;
  
  data->modelData->nAliasReal = 0;
  data->modelData->nAliasInteger = 0;
  data->modelData->nAliasBoolean = 0;
  data->modelData->nAliasString = 0;
  
  data->modelData->nZeroCrossings = 3;
  data->modelData->nSamples = 0;
  data->modelData->nRelations = 2;
  data->modelData->nMathEvents = 0;
  data->modelData->nExtObjs = 0;
  
  data->modelData->modelDataXml.fileName = "BouncingBall_info.json";
  data->modelData->modelDataXml.modelInfoXmlLength = 0;
  data->modelData->modelDataXml.nFunctions = 0;
  data->modelData->modelDataXml.nProfileBlocks = 0;
  data->modelData->modelDataXml.nEquations = 24;
  data->modelData->nMixedSystems = 0;
  data->modelData->nLinearSystems = 0;
  data->modelData->nNonLinearSystems = 0;
  data->modelData->nStateSets = 0;
  data->modelData->nJacobians = 5;
  data->modelData->nOptimizeConstraints = 0;
  data->modelData->nOptimizeFinalConstraints = 0;
  
  data->modelData->nDelayExpressions = 0;
  
  data->modelData->nClocks = 0;
  data->modelData->nSubClocks = 0;
  
  data->modelData->nSensitivityVars = 0;
  data->modelData->nSensitivityParamVars = 0;
  data->modelData->nSetcVars = 0;
  data->modelData->ndataReconVars = 0;
  data->modelData->linearizationDumpLanguage =
  OMC_LINEARIZE_DUMP_LANGUAGE_MODELICA;
}

static int rml_execution_failed()
{
  fflush(NULL);
  fprintf(stderr, "Execution failed!\n");
  fflush(NULL);
  return 1;
}

#if defined(threadData)
#undef threadData
#endif
/* call the simulation runtime main from our main! */
int main(int argc, char**argv)
{
  int res;
  DATA data;
  MODEL_DATA modelData;
  SIMULATION_INFO simInfo;
  data.modelData = &modelData;
  data.simulationInfo = &simInfo;
  measure_time_flag = 0;
  compiledInDAEMode = 0;
  compiledWithSymSolver = 0;
  MMC_INIT(0);
  omc_alloc_interface.init();
  {
    MMC_TRY_TOP()
  
    MMC_TRY_STACK()
  
    BouncingBall_setupDataStruc(&data, threadData);
    res = _main_SimulationRuntime(argc, argv, &data, threadData);
    
    MMC_ELSE()
    rml_execution_failed();
    fprintf(stderr, "Stack overflow detected and was not caught.\nSend us a bug report at https://trac.openmodelica.org/OpenModelica/newticket\n    Include the following trace:\n");
    printStacktraceMessages();
    fflush(NULL);
    return 1;
    MMC_CATCH_STACK()
    
    MMC_CATCH_TOP(return rml_execution_failed());
  }

  fflush(NULL);
  EXIT(res);
  return res;
}

#ifdef __cplusplus
}
#endif


