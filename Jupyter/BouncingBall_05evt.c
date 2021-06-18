/* Events: Sample, Zero Crossings, Relations, Discrete Changes */
#include "BouncingBall_model.h"
#if defined(__cplusplus)
extern "C" {
#endif

/* Initializes the raw time events of the simulation using the now
   calcualted parameters. */
void BouncingBall_function_initSample(DATA *data, threadData_t *threadData)
{
  long i=0;
}

const char *BouncingBall_zeroCrossingDescription(int i, int **out_EquationIndexes)
{
  static const char *res[] = {"h <= 0.0 and v <= 0.0",
  "h <= 0.0",
  "v <= 0.0"};
  static const int occurEqs0[] = {1,22};
  static const int occurEqs1[] = {1,14};
  static const int occurEqs2[] = {1,16};
  static const int *occurEqs[] = {occurEqs0,occurEqs1,occurEqs2};
  *out_EquationIndexes = (int*) occurEqs[i];
  return res[i];
}

/* forwarded equations */
extern void BouncingBall_eqFunction_14(DATA* data, threadData_t *threadData);
extern void BouncingBall_eqFunction_16(DATA* data, threadData_t *threadData);
extern void BouncingBall_eqFunction_17(DATA* data, threadData_t *threadData);
extern void BouncingBall_eqFunction_20(DATA* data, threadData_t *threadData);
extern void BouncingBall_eqFunction_21(DATA* data, threadData_t *threadData);

int BouncingBall_function_ZeroCrossingsEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->callStatistics.functionZeroCrossingsEquations++;

  BouncingBall_eqFunction_14(data, threadData);

  BouncingBall_eqFunction_16(data, threadData);

  BouncingBall_eqFunction_17(data, threadData);

  BouncingBall_eqFunction_20(data, threadData);

  BouncingBall_eqFunction_21(data, threadData);
  
  TRACE_POP
  return 0;
}

int BouncingBall_function_ZeroCrossings(DATA *data, threadData_t *threadData, double *gout)
{
  TRACE_PUSH
  modelica_boolean tmp0;
  modelica_boolean tmp1;
  modelica_boolean tmp2;
  modelica_boolean tmp3;

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_ZC);
#endif
  data->simulationInfo->callStatistics.functionZeroCrossings++;

  tmp0 = LessEqZC(data->localData[0]->realVars[0] /* h STATE(1,v) */, 0.0, data->simulationInfo->storedRelations[0]);
  tmp1 = LessEqZC(data->localData[0]->realVars[1] /* v STATE(1) */, 0.0, data->simulationInfo->storedRelations[1]);
  gout[0] = ((tmp0 && tmp1)) ? 1 : -1;
  tmp2 = LessEqZC(data->localData[0]->realVars[0] /* h STATE(1,v) */, 0.0, data->simulationInfo->storedRelations[0]);
  gout[1] = (tmp2) ? 1 : -1;
  tmp3 = LessEqZC(data->localData[0]->realVars[1] /* v STATE(1) */, 0.0, data->simulationInfo->storedRelations[1]);
  gout[2] = (tmp3) ? 1 : -1;

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_ZC);
#endif

  TRACE_POP
  return 0;
}

const char *BouncingBall_relationDescription(int i)
{
  const char *res[] = {"h <= 0.0",
  "v <= 0.0"};
  return res[i];
}

int BouncingBall_function_updateRelations(DATA *data, threadData_t *threadData, int evalforZeroCross)
{
  TRACE_PUSH
  modelica_boolean tmp4;
  modelica_boolean tmp5;
  
  if(evalforZeroCross) {
    tmp4 = LessEqZC(data->localData[0]->realVars[0] /* h STATE(1,v) */, 0.0, data->simulationInfo->storedRelations[0]);
    data->simulationInfo->relations[0] = tmp4;
    tmp5 = LessEqZC(data->localData[0]->realVars[1] /* v STATE(1) */, 0.0, data->simulationInfo->storedRelations[1]);
    data->simulationInfo->relations[1] = tmp5;
  } else {
    data->simulationInfo->relations[0] = (data->localData[0]->realVars[0] /* h STATE(1,v) */ <= 0.0);
    data->simulationInfo->relations[1] = (data->localData[0]->realVars[1] /* v STATE(1) */ <= 0.0);
  }
  
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

