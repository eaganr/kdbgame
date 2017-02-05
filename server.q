\l json.k

.z.ts: {
  if[3 > count coins; `coins insert (5*(1?100);5*(1?100))];
  sendAll[];
  };

sendAll: {
  {neg[x] jsonify["coins";coins]} each connections`handle;
  {neg[x] jsonify["players";connections]} each connections`handle;
  };

jsonify:{[name;data]
  .j.j ("name";"data")!(name;data)
  };

connections:flip `handle`xcord`ycord`score!();
coins:flip `xcord`ycord!();

.z.wo: {
  neg[.z.w] jsonify["num"; .z.w];
  `connections insert (.z.w;0;0;0);
  sendAll[];
  };

.z.ws: {
  cords: "," vs x;
  nxcord:"I"$cords[0];
  nycord:"I"$cords[1];
  
  / check for coin hit
  { if[(x = z`xcord)&(y = z`ycord);
    update score:score+1 from `connections where handle=.z.w;
    delete from `coins where xcord=x, ycord=y;
    ];
  }[nxcord;nycord] each coins;
  
  update xcord:nxcord, ycord:nycord from `connections where handle=.z.w;
  sendAll[];
  };

.z.wc: {
  delete from `connections where handle=x;
  sendAll[];
  };

.z.ph: {}


\p 8500
\t 1000
