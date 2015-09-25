   <script src="include/Gantt_diagram/codebase/dhtmlxgantt.js"></script>   
   <link href="include/Gantt_diagram/codebase/dhtmlxgantt.css" rel="stylesheet">   
    
    <div id="gantt_here" style='auto; height:400px;'></div>
    
    <script type="text/javascript">
        var tasks = {
    data:[
        {id:1, text:"Project #1",start_date:"01-04-2013", duration:11,
        progress: 0.6, open: true},
        {id:2, text:"Task #1",   start_date:"03-04-2013", duration:5, 
        progress: 1,   open: true, parent:1},
        {id:3, text:"Task #2",   start_date:"02-04-2013", duration:7, 
        progress: 0.5, open: true, parent:1},
        {id:4, text:"Task #2.1", start_date:"03-04-2013", duration:2, 
        progress: 1,   open: true, parent:3},
        {id:5, text:"Task #2.2", start_date:"04-04-2013", duration:3, 
        progress: 0.8, open: true, parent:3},
        {id:6, text:"Task #2.3", start_date:"05-04-2013", duration:4, 
        progress: 0.2, open: true, parent:3},
        {id:7,text:"Kure",start_date:"02-04-2013", duration:5,
         progress: 0.5, open:true}
    ],
    links:[
        {id:1, source:1, target:2, type:"1"},
        {id:2, source:1, target:3, type:"1"},
        {id:3, source:3, target:4, type:"1"},
        {id:4, source:4, target:5, type:"0"},
        {id:5, source:5, target:6, type:"0"}
        ]
        };
        
        gantt.init("gantt_here");
        gantt.parse(tasks);
    </script>