module CoExpression 
{

  typedef string obj_ref;

  /*
      Designed to support for p-value distribution plot to give idea on what would be good p-value cut off but it can be used for other purpose.
      @optional xlabel ylabel xlog_mode ylog_mode title description plot_type properties xgroup ygroup xgtick_labels ygtick_labels original_data
  */
  typedef structure {
    string xlabel; /* labels for xaxis */
    string ylabel; /* labels for xaxis */
    string xlog_mode; /* x axis log mode : "none", "log2", "log10", "-log2", "-log10", "no^-log2" for switching between no log and -log2, "no^log10" for switching between "none" and "log10", etc */
    string ylog_mode; /* y axis log mode : "none", "log2", "log10", "-log2", "-log10", "no^-log2" for switching between no log and -log2, "no^log10" for switching between "none" and "log10", etc */
    string title; /* title of plot */
    string description; /* description of plot */
    string plot_type; /* histogram, scatter, bar, treemap, pie, auto, user_select etc */
    list<int> xgroup; /* x axis each group size */
    list<int> ygroup; /* y axis each group size */
    list<string> xgtick_labels; /* x axis each group name list */
    list<string> ygtick_labels; /* y axis each group name list */
    mapping<string, string> properties; /* additional properties */
    obj_ref data_ref; /* data object such as MAK.FloatDataTable */
    obj_ref original_data; /* original data object */
  } FigureProperties;

  /* @id ws CoExpression.FigureProperties */
  typedef string ws_figure_properties;

  /*
      Multi-cluster heat map plot object
      @optional description
  */
  typedef structure {
    ws_figure_properties figure_obj;
    string description;
  } MulticlusterHeatmapPlot;

  /*
      P-value distribution plot
      @optional description
  */
  typedef structure {
    ws_figure_properties figure_obj;
    string description;
  } PvalueDistributionPlot;

};



