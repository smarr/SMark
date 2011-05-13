NPBISBase definines the commonalities for the general benchmark and its actual worker-threads.

See NPBSuite>>benchIS for the actual benchmark implemented based on SMark.

Instance Variables:
	testIndexArray	<Object>
	testRankArray	<Object>
	masterHist	<(SequenceableCollection of: Object)>
	keyArray	<(Array of: (CharacterBlock | Magnitude | Point | String | UUID))>
	partialVerifyVals	<Array>
	sizeClass	<ProtoObject | PseudoContext>
	totalKeys	<Collection | Duration | Number | Point>
	maxKey	<Collection | Duration | Number | Point>
	numBuckets	<ProtoObject | PseudoContext>
	numKeys	<Collection | Color | DateAndTime | Duration | Number | OBMetaNode | Point | Timespan | TraitComposition | TraitDescription | TraitTransformation>
	sizeOfBuffers	<ProtoObject | PseudoContext>
	timerOn	<ProtoObject | PseudoContext>
	timer	<ProtoObject | PseudoContext>
	totalKeysLog2	<ProtoObject | PseudoContext>
	maxKeyLog2	<ProtoObject | PseudoContext>
	numBucketsLog2	<ProtoObject | PseudoContext>
	numThreads	<ProtoObject | PseudoContext>
	rankThreads	<(SequenceableCollection of: RankThread)>
	master	<NPBISBase>
	benchmarkClass	<ProtoObject>
	mtxNotify	<Semaphore>
	mtxCritical	<Semaphore>