const grid = new tui.Grid({
    el: document.getElementById('grid'),
    scrollX: false,
    scrollY: false,
    header: {
      height: 160,
      complexColumns: [
        {
          header: 'Basic',
          name: 'mergeColumn1',
          childNames: ['name', 'artist']
        },
        {
          header: 'Extra',
          name: 'mergeColumn2',
          childNames: ['type', 'release', 'genre']
        },
        {
          header: 'Detail',
          name: 'mergeColumn3',
          childNames: ['mergeColumn1', 'mergeColumn2']
        },
        {
          header: 'Count',
          name: 'mergeColumn4',
          childNames: ['downloadCount', 'listenCount']
        },
        {
          header: 'Album Info',
          name: 'mergeColumn5',
          childNames: ['price', 'mergeColumn3', 'mergeColumn4']
        }
      ]
    },
    columns: [
      {
        header: 'Name',
        name: 'name'
      },
      {
        header: 'Artist',
        name: 'artist'
      },
      {
        header: 'Type',
        name: 'type'
      },
      {
        header: 'Release',
        name: 'release'
      },
      {
        header: 'Genre',
        name: 'genre'
      },
      {
        header: 'Price',
        name: 'price'
      },
      {
        header: 'Download',
        name: 'downloadCount'
      },
      {
        header: 'Listen',
        name: 'listenCount'
      }
    ]
  });