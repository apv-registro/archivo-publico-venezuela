(() => {
  const state = { records: [], filter: 'all', query: '' };
  const input = document.querySelector('#search');
  const list = document.querySelector('#result-list');
  const count = document.querySelector('#result-count');
  const empty = document.querySelector('#empty-state');
  const labels = { case: 'Acto', person: 'Persona', institution: 'Institución' };

  const normalized = value => (value || '')
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();

  function render() {
    const query = normalized(state.query);
    const records = state.records.filter(record => {
      const typeMatch = state.filter === 'all' || record.type === state.filter;
      const haystack = normalized([record.title, record.summary, ...(record.keywords || [])].join(' '));
      return typeMatch && (!query || haystack.includes(query));
    });

    list.replaceChildren(...records.map(record => {
      const article = document.createElement('article');
      article.className = 'result-card';
      const type = document.createElement('span');
      type.className = 'result-type';
      type.textContent = labels[record.type] || record.type;
      const content = document.createElement('div');
      const title = document.createElement('h2');
      if (record.href) {
        const link = document.createElement('a');
        link.href = record.href;
        link.textContent = record.title;
        title.append(link);
      } else {
        title.textContent = record.title;
      }
      const summary = document.createElement('p');
      summary.textContent = record.summary;
      content.append(title, summary);
      const date = document.createElement('time');
      date.className = 'result-date';
      date.dateTime = record.date || '';
      date.textContent = record.date || '—';
      article.append(type, content, date);
      return article;
    }));

    count.textContent = `${records.length} ${records.length === 1 ? 'registro' : 'registros'}`;
    empty.hidden = records.length !== 0;
  }

  input.addEventListener('input', event => { state.query = event.target.value; render(); });
  document.querySelectorAll('.filter').forEach(button => {
    button.addEventListener('click', () => {
      document.querySelector('.filter.is-active')?.classList.remove('is-active');
      button.classList.add('is-active');
      state.filter = button.dataset.filter;
      render();
    });
  });

  fetch('data/catalog.json')
    .then(response => { if (!response.ok) throw new Error('catalog'); return response.json(); })
    .then(records => { state.records = records; render(); })
    .catch(() => { count.textContent = 'Archivo no disponible'; empty.hidden = false; });
})();
