/* Initialization */
#include "BouncingBall_model.h"
#include "BouncingBall_11mix.h"
#include "BouncingBall_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif

void BouncingBall_functionInitialEquations_0(DATA *data, threadData_t *threadData);

/*
equation index: 1
type: SIMPLE_ASSIGN
h = $START.h
*/
void BouncingBall_eqFunction_1(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1};
  data->localData[0]->realVars[0] /* h STATE(1,v) */ = data->modelData->realVarsData[0].attribute /* h STATE(1,v) */.start;
  TRACE_POP
}
extern void BouncingBall_eqFunction_14(DATA *data, threadData_t *threadData);

extern void BouncingBall_eqFunction_17(DATA *data, threadData_t *threadData);

extern void BouncingBall_eqFunction_15(DATA *data, threadData_t *threadData);


/*
equation index: 5
type: SIMPLE_ASSIGN
v = $START.v
*/
void BouncingBall_eqFunction_5(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,5};
  data->localData[0]->realVars[1] /* v STATE(1) */ = data->modelData->realVarsData[1].attribute /* v STATE(1) */.start;
  TRACE_POP
}
extern void BouncingBall_eqFunction_22(DATA *data, threadData_t *threadData);

extern void BouncingBall_eqFunction_16(DATA *data, threadData_t *threadData);

extern void BouncingBall_eqFunction_21(DATA *data, threadData_t *threadData);


/*
equation index: 9
type: SIMPLE_ASSIGN
$PRE.flying = true
*/
void BouncingBall_eqFunction_9(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,9};
  data->simulationInfo->booleanVarsPre[3] /* flying DISCRETE */ = 1;
  TRACE_POP
}

/*
equation index: 10
type: SIMPLE_ASSIGN
flying = $PRE.flying
*/
void BouncingBall_eqFunction_10(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,10};
  data->localData[0]->booleanVars[3] /* flying DISCRETE */ = data->simulationInfo->booleanVarsPre[3] /* flying DISCRETE */;
  TRACE_POP
}
extern void BouncingBall_eqFunction_20(DATA *data, threadData_t *threadData);


/*
equation index: 12
type: SIMPLE_ASSIGN
$PRE.v_new = 0.0
*/
void BouncingBall_eqFunction_12(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,12};
  data->simulationInfo->realVarsPre[4] /* v_new DISCRETE */ = 0.0;
  TRACE_POP
}

/*
equation index: 13
type: SIMPLE_ASSIGN
v_new = $PRE.v_new
*/
void BouncingBall_eqFunction_13(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,13};
  data->localData[0]->realVars[4] /* v_new DISCRETE */ = data->simulationInfo->realVarsPre[4] /* v_new DISCRETE */;
  TRACE_POP
}
OMC_DISABLE_OPT
void BouncingBall_functionInitialEquations_0(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  BouncingBall_eqFunction_1(data, threadData);
  BouncingBall_eqFunction_14(data, threadData);
  BouncingBall_eqFunction_17(data, threadData);
  BouncingBall_eqFunction_15(data, threadData);
  BouncingBall_eqFunction_5(data, threadData);
  BouncingBall_eqFunction_22(data, threadData);
  BouncingBall_eqFunction_16(data, threadData);
  BouncingBall_eqFunction_21(data, threadData);
  BouncingBall_eqFunction_9(data, threadData);
  BouncingBall_eqFunction_10(data, threadData);
  BouncingBall_eqFunction_20(data, threadData);
  BouncingBall_eqFunction_12(data, threadData);
  BouncingBall_eqFunction_13(data, threadData);
  TRACE_POP
}

int BouncingBall_functionInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->discreteCall = 1;
  BouncingBall_functionInitialEquations_0(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
  TRACE_POP
  return 0;
}

/* No BouncingBall_functionInitialEquations_lambda0 function */

int BouncingBall_functionRemovedInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;
  double res = 0.0;

  
  TRACE_POP
  return 0;
}


#if defined(__cplusplus)
}
#endif

