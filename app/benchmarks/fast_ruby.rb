class FastRuby

  def self.run
    # Array
    ArrayFirstVsIndex.new.run
    ArrayLastVsIndex.new.run
    BsearchVsFind.new.run
    CountVsSize.new.run
    ShuffleFirstVsSample.new.run

    # Enumerable
    EachPushVsMap.new.run
    EachVsForLoop.new.run
    EachWithIndexVsWhileLoop.new.run
    MapFlattenVsFlatMap.new.run
    ReverseEachVsReverseEach.new.run
    SelectFirstVsDetect.new.run
    SelectLastVsReverseDetect.new.run
    SortVsSortBy.new.run

    # General
    Assignment.new.run
    AttrAccessorVsGetterAndSetter.new.run
    BeginRescueVsRespondTo.new.run
    BlockApplyMethod.new.run
    # DefineMethodVsModuleEval.new.run # Eval not supported

    # Hash
    BracketVsDup.new.run
    BracketVsFetch.new.run
    FetchVsFetchWithBlock.new.run
    # HashKeySortbyVsSort.new.run # #to_h not supported
    KeysEachVsEachKey.new.run
    MergeBangVsSquareEqual.new.run
    MergeVsMergeBang.new.run

    # Method
    CallVsSendVsMethodMissing.new.run

    # Proc and block
    BlockVsToProc.new.run
    ProcCallVsYield.new.run

    # Range
    CoverVsInclude.new.run

    # String
    CasecmpVsDowncase.new.run
    Concatenation.new.run
    EndStringCheckingMatchVsStartWith.new.run
    GsubVsSub.new.run
    GsubVsTr.new.run
    StartStringCheckingMatchVsStartWith.new.run
    SubVsGsubVsSquareEqual.new.run
  end

end
