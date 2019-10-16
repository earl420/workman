var Grid = tui.Grid;
Grid.setLanguage('ko');
Grid.applyTheme('clean');
const grid = new tui.Grid({
    el: document.getElementById('grid'),
    scrollX: false,
    scrollY: false,
    columns:{align:'center'},   
    header: {
      height: 100,
      complexColumns: [
        {
          header: '재무상태표',
          name: 'accountStatus',
          childNames: ['deptside','account1','credit','account2']
        },
        {
        	header:"자산",
        	name:'asset',
        	childName:['deptside','account1']
        },
        {
        	header:"자본/부채",
        	name:'debt',
        	childName:['credit','account2']
        }
      ]
    },
    columns: [
      {
        header: '계정과목',
        name: 'deptside'
      },
      {
        header: '금액',
        name: 'account1'
      },
      {
        header: '계정과목',
        name: 'credit'
      },
      {
        header: '금액',
        name: 'account2'
      }
    ], 
    data:[{deptside:'자산', account1:'', credit:'부채',account2:""},
    	{deptside:'현금', account1:1000000, credit:'단기부채',account2:500000}]
    	
    
  });
