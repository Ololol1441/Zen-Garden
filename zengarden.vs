<!DOCTYPE html>
<html lang="nb">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Zen Garden • V5.5</title>

<style>
*{box-sizing:border-box}

html,body{
  margin:0;
  min-height:100%;
  font-family:Georgia,"Times New Roman",serif;
}

body{
  background:#24352b;
  color:#f4e5c7;
  overflow-x:hidden;
  transition:background .8s;
}

button{
  font:inherit;
  cursor:pointer;
  border:0;
}

.hidden{display:none!important}

/* =========================================================
   TOPPMENY
========================================================= */

.topbar{
  height:94px;
  background:linear-gradient(180deg,#69482f,#563a27);
  border-bottom:3px solid #8d6846;
  display:flex;
  align-items:center;
  padding:12px 20px;
  gap:18px;
  position:sticky;
  top:0;
  z-index:1000;
  box-shadow:0 5px 25px #0007;
}

.brand{
  display:flex;
  align-items:center;
  gap:15px;
  flex:1;
  min-width:250px;
}

.logo{
  font-size:49px;
  filter:drop-shadow(0 3px 3px #0008);
}

.brand h1{
  margin:0;
  font-size:32px;
  line-height:1;
}

.brand small{
  display:block;
  margin-top:5px;
  color:#d8c6a8;
  font-size:16px;
}

.top-stats{
  display:flex;
  gap:10px;
  align-items:center;
}

.stat{
  background:#20251fdd;
  border:1px solid #765738;
  border-radius:16px;
  min-width:98px;
  height:51px;
  padding:7px 14px;
  display:flex;
  align-items:center;
  justify-content:center;
  gap:7px;
  font-weight:bold;
  white-space:nowrap;
}

.hamburger{
  width:67px;
  height:67px;
  border-radius:17px;
  background:#294238;
  border:1px solid #9a7047;
  display:flex;
  flex-direction:column;
  justify-content:center;
  align-items:center;
  gap:7px;
}

.hamburger span{
  width:33px;
  height:4px;
  border-radius:5px;
  background:#e9dcc1;
}

/* =========================================================
   SIDE / PAGE
========================================================= */

.page{
  width:calc(100% - 84px);
  margin:26px auto 70px;
  max-width:1600px;
}

/* =========================================================
   INFORMASJONSKORT
========================================================= */

.info-grid{
  display:grid;
  grid-template-columns:1fr 1fr 1fr;
  gap:20px;
  margin-bottom:20px;
}

.info-card{
  min-height:168px;
  background:linear-gradient(145deg,#213228,#192a21);
  border:1px solid #795b3d;
  border-radius:24px;
  padding:21px;
  box-shadow:
    inset 0 0 30px #0003,
    0 8px 22px #0003;
  overflow:hidden;
}

.info-title{
  font-size:26px;
  font-weight:bold;
  margin-bottom:13px;
}

.weather-main{
  display:flex;
  align-items:center;
  gap:18px;
  font-size:45px;
}

.weather-name{
  font-size:42px;
}

.info-sub{
  text-align:center;
  margin-top:8px;
  color:#d8c6a8;
}

.boss-name{
  font-size:25px;
  margin:7px 0 11px;
}

.boss-bar{
  height:19px;
  border-radius:15px;
  background:#4c2828;
  overflow:hidden;
  border:1px solid #8b6545;
}

.boss-fill{
  height:100%;
  background:linear-gradient(90deg,#ff4747,#ffb63d);
  transition:.25s;
}

.boss-meta{
  text-align:center;
  margin-top:8px;
}

.event-main{
  font-size:24px;
  line-height:1.35;
}

/* =========================================================
   HAGE
========================================================= */

.garden-shell{
  border:4px solid #825d3e;
  border-radius:40px;
  padding:28px;
  background:
    linear-gradient(#334b31aa,#334b3170),
    repeating-linear-gradient(
      0deg,
      #354d31 0px,
      #354d31 17px,
      #31472e 18px,
      #31472e 22px
    );
  box-shadow:
    inset 0 0 40px #182519,
    0 8px 30px #0005;
  position:relative;
  min-height:650px;
}

.garden-inner{
  padding:33px 40px 40px;
  border-radius:30px;
  background:
    repeating-linear-gradient(
      0deg,
      #3b5335 0px,
      #3b5335 16px,
      #365030 17px,
      #365030 20px
    );
  border:1px solid #566747;
  min-height:570px;
}

.garden-layout{
  display:grid;
  grid-template-columns:minmax(0,1fr) 235px;
  gap:20px;
}

.plots{
  display:grid;
  grid-template-columns:repeat(5,minmax(130px,1fr));
  gap:25px;
}

.plot{
  min-height:218px;
  border-radius:29px;
  position:relative;
  display:flex;
  flex-direction:column;
  align-items:center;
  justify-content:center;
  text-align:center;
  padding:14px;
  transition:.18s;
}

.plot.unlocked{
  background:
    radial-gradient(circle at 50% 20%,#8a5938,#57351f 70%);
  border:3px solid #946542;
  box-shadow:
    inset 0 0 30px #2d170d,
    0 5px 12px #0005;
}

.plot.unlocked:hover{
  transform:translateY(-3px);
}

.plot.locked{
  background:
    linear-gradient(#5a482cdd,#4a3a27dd),
    repeating-linear-gradient(
      45deg,
      #574328,
      #574328 7px,
      #4e3d29 7px,
      #4e3d29 14px
    );
  border:3px dashed #705737;
  color:#d5c7a9;
  cursor:pointer;
}

.plot.locked:hover{
  transform:translateY(-4px);
  filter:brightness(1.15);
}

.lock{
  font-size:46px;
  margin-bottom:3px;
}

.plot-name{
  font-size:24px;
  font-weight:bold;
}

.plot-price{
  margin-top:9px;
  font-size:16px;
  color:#e4ca7a;
}

.plant-icon{
  font-size:55px;
  line-height:1;
}

.plant-name{
  margin-top:9px;
  font-size:21px;
  font-weight:bold;
}

.progress{
  width:85%;
  height:10px;
  background:#2a2118;
  border-radius:10px;
  overflow:hidden;
  margin-top:11px;
}

.progress-fill{
  height:100%;
  background:linear-gradient(90deg,#80c95c,#e6dc69);
}

.ready{
  color:#ffd84e;
  font-weight:bold;
  margin-top:7px;
}

.mutation{
  margin-top:5px;
  font-size:14px;
}

/* =========================================================
   HØYRE MENY
========================================================= */

.side-menu{
  display:flex;
  flex-direction:column;
  gap:14px;
  position:sticky;
  top:120px;
  align-self:start;
}

.side-btn{
  min-height:119px;
  padding:18px;
  text-align:left;
  color:#f4e5c7;
  background:linear-gradient(145deg,#38553e,#2d4434);
  border:1px solid #806043;
  border-radius:21px;
  box-shadow:0 6px 15px #0004;
  transition:.18s;
}

.side-btn:hover{
  transform:translateX(-4px);
  background:linear-gradient(145deg,#426447,#344e3b);
}

.side-btn .big{
  display:block;
  font-size:28px;
  font-weight:bold;
}

.side-btn small{
  display:block;
  font-size:17px;
  color:#d3c5a9;
  margin-top:5px;
}

/* =========================================================
   MODAL
========================================================= */

.modal{
  position:fixed;
  inset:2.5vh 2.5vw;
  z-index:5000;
  background:
    radial-gradient(circle at top,#294536,#17261e 65%);
  border:3px solid #866142;
  border-radius:30px;
  box-shadow:0 20px 80px #000c;
  overflow:auto;
  padding:32px;
}

.modal-head{
  display:flex;
  justify-content:space-between;
  align-items:center;
  gap:20px;
  border-bottom:1px solid #72553a;
  padding-bottom:17px;
  margin-bottom:20px;
}

.modal-head h2{
  margin:0;
  font-size:32px;
}

.close{
  width:50px;
  height:50px;
  border-radius:14px;
  background:#563c29;
  color:#f7e9ca;
  font-size:28px;
}

.shop-grid,
.pet-grid,
.upgrade-grid,
.boss-grid{
  display:grid;
  grid-template-columns:repeat(auto-fit,minmax(240px,1fr));
  gap:17px;
}

.card{
  background:#203329;
  border:1px solid #765a3e;
  border-radius:20px;
  padding:18px;
  box-shadow:inset 0 0 25px #0003;
}

.card h3{
  margin:4px 0 8px;
  font-size:23px;
}

.card p{
  color:#d7c8aa;
  margin:7px 0;
}

.card button,
.action{
  width:100%;
  margin-top:11px;
  padding:12px;
  border-radius:13px;
  background:#80613e;
  color:#fff4dc;
  font-weight:bold;
}

.card button:hover,
.action:hover{
  filter:brightness(1.15);
}

.card button:disabled{
  opacity:.45;
  cursor:not-allowed;
}

.rarity{
  font-weight:bold;
}

.common{color:#b7b7b7}
.uncommon{color:#49d66d}
.rare{color:#4aa3ff}
.epic{color:#b66cff}
.mythical{color:#ff4f5e}
.exotic{color:#7ee8ff}
.legendary{color:#ffd34d}

.seed-icon{
  font-size:42px;
}

/* =========================================================
   SHOP PENGER
========================================================= */

.shop-money{
  background:linear-gradient(145deg,#3b5238,#293d30);
  border:2px solid #947049;
  border-radius:18px;
  padding:18px;
  margin-bottom:22px;
  font-size:24px;
  font-weight:bold;
  text-align:center;
  box-shadow:inset 0 0 20px #0003;
}

.shop-money span{
  color:#ffd66a;
}

/* =========================================================
   START
========================================================= */

.home{
  min-height:100vh;
  display:flex;
  justify-content:center;
  align-items:center;
  padding:30px;
  background:
    radial-gradient(circle at 50% 20%,#38533d,#18271f 70%);
}

.home-box{
  width:min(700px,100%);
  padding:45px;
  background:#1d3026ee;
  border:2px solid #896545;
  border-radius:32px;
  box-shadow:0 20px 70px #0009;
  text-align:center;
}

.home-logo{
  font-size:75px;
}

.home h1{
  font-size:48px;
  margin:8px 0;
}

.home p{
  color:#d9c9ab;
  font-size:19px;
}

.name-input{
  width:100%;
  padding:16px;
  border-radius:14px;
  border:1px solid #806042;
  background:#142119;
  color:white;
  font-size:20px;
  margin:14px 0;
}

.start-btn{
  width:100%;
  padding:16px;
  border-radius:15px;
  background:#80603f;
  color:#fff1d1;
  font-size:21px;
  font-weight:bold;
}

.home-buttons{
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:12px;
  margin-top:15px;
}

.home-buttons button{
  padding:14px;
  border-radius:13px;
  background:#2d4838;
  color:#f0e2c4;
}

/* =========================================================
   TOAST
========================================================= */

#toast{
  position:fixed;
  left:50%;
  bottom:25px;
  transform:translateX(-50%) translateY(100px);
  z-index:10000;
  background:#192b21ee;
  border:1px solid #a17a4e;
  color:#f5e6c8;
  padding:14px 22px;
  border-radius:15px;
  box-shadow:0 10px 30px #0008;
  transition:.3s;
  pointer-events:none;
  max-width:90%;
  text-align:center;
}

#toast.show{
  transform:translateX(-50%) translateY(0);
}

/* =========================================================
   VÆR
========================================================= */

#weatherLayer{
  position:fixed;
  inset:94px 0 0;
  z-index:40;
  pointer-events:none;
  overflow:hidden;
}

/* REGN */

.rain-drop{
  position:absolute;
  top:-80px;
  width:2px;
  height:42px;
  background:linear-gradient(transparent,#9bdcff);
  opacity:.75;
  animation:rainFall linear forwards;
}

@keyframes rainFall{
  to{
    transform:translateY(110vh) translateX(-70px);
  }
}

/* SNØ */

.snow{
  position:absolute;
  top:-30px;
  width:9px;
  height:9px;
  border-radius:50%;
  background:#eefaff;
  opacity:.8;
  animation:snowFall linear forwards;
}

@keyframes snowFall{
  to{
    transform:translateY(110vh) translateX(50px);
  }
}

/* TÅKE */

.fog{
  position:absolute;
  width:60vw;
  height:180px;
  border-radius:50%;
  background:#dce8df22;
  filter:blur(25px);
  animation:fogMove 18s linear infinite alternate;
}

@keyframes fogMove{
  from{transform:translateX(-20vw)}
  to{transform:translateX(70vw)}
}

/* LYN */

.lightning{
  position:absolute;
  inset:0;
  background:#dff4ff33;
  animation:flash 5s infinite;
}

@keyframes flash{
  0%,91%,94%,100%{opacity:0}
  92%,93%{opacity:1}
}

/* SOLPARTIKLER */

.sun-particle{
  position:absolute;
  width:7px;
  height:7px;
  border-radius:50%;
  background:#ffe28a99;
  animation:float 5s ease-in-out infinite;
}

@keyframes float{
  50%{
    transform:translateY(-30px);
    opacity:.2;
  }
}

/* =========================================================
   REGNBUE V5.5
   Ca. 70 % gjennomsiktig = 30 % synlig farge
========================================================= */

.rainbow-overlay{
  position:fixed;
  inset:0;
  z-index:35;
  pointer-events:none;
  opacity:.30;
  background:
    linear-gradient(
      180deg,
      rgba(255,70,70,.95) 0%,
      rgba(255,165,60,.90) 16%,
      rgba(255,235,80,.90) 32%,
      rgba(90,220,100,.90) 48%,
      rgba(70,180,255,.90) 64%,
      rgba(100,100,255,.90) 80%,
      rgba(210,90,255,.90) 100%
    );
  mix-blend-mode:screen;
}

/* =========================================================
   EVENT
========================================================= */

#eventVisual{
  position:fixed;
  inset:94px 0 0;
  z-index:38;
  pointer-events:none;
}

/* SAKURA */

.sakura-tree{
  position:absolute;
  right:6%;
  bottom:4%;
  width:300px;
  height:380px;
  animation:sakuraGrow 3s ease-out;
}

@keyframes sakuraGrow{
  from{
    transform:scale(.1);
    transform-origin:bottom right;
  }
  to{
    transform:scale(1);
  }
}

.trunk{
  position:absolute;
  right:120px;
  bottom:0;
  width:35px;
  height:260px;
  background:linear-gradient(90deg,#3a2117,#71442b,#3a2117);
  border-radius:30px;
  transform:rotate(-5deg);
}

.branch{
  position:absolute;
  height:18px;
  background:#563020;
  border-radius:20px;
  transform-origin:left;
}

.b1{
  right:128px;
  bottom:190px;
  width:160px;
  transform:rotate(-35deg);
}

.b2{
  right:125px;
  bottom:230px;
  width:145px;
  transform:rotate(35deg);
}

.b3{
  right:140px;
  bottom:145px;
  width:130px;
  transform:rotate(-65deg);
}

.blossom{
  position:absolute;
  width:24px;
  height:24px;
  border-radius:50%;
  background:#ff9dbb;
  box-shadow:
    13px 2px #ffb1c8,
    -10px 6px #ff8faf,
    3px -11px #ffb6cb,
    15px -10px #ff9dbb;
}

.b01{right:260px;bottom:305px}
.b02{right:175px;bottom:335px}
.b03{right:100px;bottom:310px}
.b04{right:235px;bottom:260px}
.b05{right:145px;bottom:265px}
.b06{right:75px;bottom:240px}
.b07{right:255px;bottom:205px}
.b08{right:180px;bottom:220px}
.b09{right:105px;bottom:190px}

.petal{
  position:absolute;
  width:8px;
  height:13px;
  background:#ff9fba;
  border-radius:70% 20% 70% 20%;
  animation:petalFall 5s linear infinite;
}

@keyframes petalFall{
  from{
    transform:translateY(-20px) rotate(0);
  }
  to{
    transform:translateY(90vh) translateX(100px) rotate(450deg);
  }
}

/* =========================================================
   NATT
========================================================= */

body.night{
  background:#18262d;
}

body.night .garden-shell{
  filter:brightness(.82);
}

/* =========================================================
   REBIRTH
========================================================= */

.rebirth-box{
  max-width:650px;
  margin:30px auto;
  text-align:center;
  background:#203329;
  border:1px solid #806042;
  border-radius:25px;
  padding:30px;
}

.rebirth-btn{
  padding:15px 30px;
  border-radius:14px;
  background:#8b6741;
  color:#fff0cf;
  font-weight:bold;
  font-size:20px;
}

/* =========================================================
   RESPONSIV
========================================================= */

@media(max-width:1150px){

  .page{
    width:calc(100% - 30px);
  }

  .plots{
    grid-template-columns:repeat(4,1fr);
  }

  .garden-layout{
    grid-template-columns:1fr;
  }

  .side-menu{
    position:static;
    display:grid;
    grid-template-columns:repeat(3,1fr);
  }
}

@media(max-width:850px){

  .topbar{
    height:auto;
    flex-wrap:wrap;
  }

  .brand{
    min-width:0;
  }

  .top-stats{
    order:3;
    width:100%;
    overflow:auto;
  }

  .info-grid{
    grid-template-columns:1fr;
  }

  .plots{
    grid-template-columns:repeat(2,1fr);
  }

  .garden-inner{
    padding:15px;
  }

  .garden-shell{
    padding:14px;
  }

  .side-menu{
    grid-template-columns:1fr;
  }
}

@media(max-width:500px){

  .brand h1{
    font-size:24px;
  }

  .logo{
    font-size:36px;
  }

  .plots{
    grid-template-columns:1fr;
  }

  .plot{
    min-height:190px;
  }

  .modal{
    inset:1vh 1vw;
    padding:18px;
  }
}
</style>
</head>

<body>

<!-- =========================================================
     START
========================================================= -->

<div id="startScreen" class="home">

  <div class="home-box">

    <div class="home-logo">🌿</div>

    <h1>Zen Garden</h1>

    <p>V5.5 • Bygg din egen Zen-hage</p>

    <div id="newGameArea">

      <input
        id="nicknameInput"
        class="name-input"
        maxlength="20"
        placeholder="Skriv kallenavnet ditt..."
      >

      <button class="start-btn" onclick="startGame()">
        🌱 Start Zen Garden
      </button>

    </div>

    <div id="existingArea" class="hidden">

      <p>
        Velkommen tilbake,
        <b id="savedName"></b>
        🌿
      </p>

      <button class="start-btn" onclick="startGame()">
        🌱 Fortsett hagen
      </button>

      <div class="home-buttons">

        <button onclick="resetProgress()">
          🔄 Nullstill fremgang
        </button>

        <button onclick="changeName()">
          ✏️ Bytt kallenavn
        </button>

      </div>

    </div>

  </div>

</div>


<!-- =========================================================
     GAME
========================================================= -->

<div id="game" class="hidden">

<header class="topbar">

  <div class="brand">

    <div class="logo">🌿</div>

    <div>
      <h1>
        Zen Garden •
        <span id="brandName">OLO</span>
      </h1>

      <small>V5.5 • Zen Garden</small>
    </div>

  </div>


  <div class="top-stats">

    <div class="stat">
      💰 <span id="moneyDisplay">0</span>
    </div>

    <div class="stat">
      🌱 <span id="plotDisplay">1/30</span>
    </div>

    <div class="stat">
      🔄 <span id="rebirthDisplay">0</span>
    </div>

    <div class="stat">
      <span id="timeIcon">☀️</span>
      <span id="timeText">Dag</span>
    </div>

  </div>


  <button
    class="hamburger"
    onclick="showHomeMenu()"
    title="Meny"
  >
    <span></span>
    <span></span>
    <span></span>
  </button>

</header>


<main class="page">

  <!-- INFO -->

  <section class="info-grid">

    <div class="info-card">

      <div class="info-title">
        🌦️ Vær
      </div>

      <div class="weather-main">

        <span id="weatherIcon">☀️</span>

        <span
          class="weather-name"
          id="weatherName"
        >
          Klar
        </span>

      </div>

      <div class="info-sub">
        Neste vær om
        <span id="weatherTimer">--</span>s
      </div>

    </div>


    <div class="info-card">

      <div class="info-title">
        👑 Boss
      </div>

      <div class="boss-name">

        <span id="bossIcon">🗿</span>

        <span id="bossName">
          Garden Guardian
        </span>

      </div>

      <div class="boss-bar">

        <div
          class="boss-fill"
          id="bossFill"
        ></div>

      </div>

      <div class="boss-meta">

        <span id="bossHP">5 000</span>
        HP • penger = DMG

      </div>

    </div>


    <div class="info-card">

      <div class="info-title">
        🎉 Event
      </div>

      <div
        class="event-main"
        id="eventText"
      >
        🎉 Ingen Event akkurat nå.
      </div>

      <div
        class="info-sub"
        id="eventTimer"
      ></div>

    </div>

  </section>


  <!-- HAGE -->

  <section class="garden-shell">

    <div class="garden-inner">

      <div class="garden-layout">

        <div
          id="plots"
          class="plots"
        ></div>


        <!-- HØYRE MENY -->

        <aside class="side-menu">

          <button
            class="side-btn"
            onclick="openShop()"
          >
            <span class="big">
              🛒 Zen Shop
            </span>

            <small>
              Frø og planter
            </small>
          </button>


          <button
            class="side-btn"
            onclick="openPets()"
          >
            <span class="big">
              🐾 Zen-kjæledyr
            </span>

            <small>
              Kjøp og utstyr
            </small>
          </button>


          <button
            class="side-btn"
            onclick="openUpgrades()"
          >
            <span class="big">
              ⚡ Zen Upgrades
            </span>

            <small>
              Oppgrader hagen
            </small>
          </button>


          <button
            class="side-btn"
            onclick="openBoss()"
          >
            <span class="big">
              👑 Boss
            </span>

            <small>
              Boss og spirit-kjæledyr
            </small>
          </button>


          <button
            class="side-btn"
            onclick="openRebirth()"
          >
            <span class="big">
              🔄 Rebirth
            </span>

            <small>
              Start på nytt sterkere
            </small>
          </button>

        </aside>

      </div>

    </div>

  </section>

</main>

</div>


<!-- VÆR -->

<div id="weatherLayer"></div>

<!-- EVENT -->

<div id="eventVisual"></div>

<!-- MODAL -->

<div
  id="modal"
  class="modal hidden"
>

  <div class="modal-head">

    <h2 id="modalTitle">
      Zen
    </h2>

    <button
      class="close"
      onclick="closeModal()"
    >
      ×
    </button>

  </div>

  <div id="modalContent"></div>

</div>

<!-- TOAST -->

<div id="toast"></div>


<script>
"use strict";

/* =========================================================
   KONSTANTER
========================================================= */

const SAVE_KEY="zenGardenSave";
const NICKNAME_KEY="zenGardenNickname";
const SAVE_VERSION=5.5;
const MAX_PLOTS=30;


/* =========================================================
   PLANTER
========================================================= */

const SEEDS=[

  {
    id:"carrot",
    name:"Gulrot",
    icon:"🥕",
    rarity:"Common",
    price:25,
    time:15,
    value:45
  },

  {
    id:"clover",
    name:"Firkløver",
    icon:"🍀",
    rarity:"Common",
    price:120,
    time:22,
    value:170
  },

  {
    id:"flower",
    name:"Blomst",
    icon:"🌷",
    rarity:"Common",
    price:180,
    time:27,
    value:245
  },

  {
    id:"strawberry",
    name:"Jordbær",
    icon:"🍓",
    rarity:"Common",
    price:260,
    time:32,
    value:350
  },

  {
    id:"berry",
    name:"Bær",
    icon:"🫐",
    rarity:"Common",
    price:360,
    time:38,
    value:500
  },

  {
    id:"sunflower",
    name:"Solsikke",
    icon:"🌻",
    rarity:"Uncommon",
    price:520,
    time:45,
    value:720
  },

  {
    id:"apple",
    name:"Eple",
    icon:"🍎",
    rarity:"Uncommon",
    price:700,
    time:52,
    value:950
  },

  {
    id:"pear",
    name:"Pære",
    icon:"🍐",
    rarity:"Uncommon",
    price:900,
    time:58,
    value:1200
  },

  {
    id:"lemon",
    name:"Sitron",
    icon:"🍋",
    rarity:"Uncommon",
    price:1150,
    time:64,
    value:1500
  },

  {
    id:"cherry",
    name:"Kirsebær",
    icon:"🍒",
    rarity:"Rare",
    price:1500,
    time:72,
    value:2000
  },

  {
    id:"lavender",
    name:"Lavendel",
    icon:"💜",
    rarity:"Rare",
    price:1900,
    time:80,
    value:2550
  },

  {
    id:"lotus",
    name:"Lotus",
    icon:"🪷",
    rarity:"Rare",
    price:2400,
    time:90,
    value:3200
  },

  {
    id:"peach",
    name:"Fersken",
    icon:"🍑",
    rarity:"Rare",
    price:3000,
    time:100,
    value:4000
  },

  {
    id:"cocoa",
    name:"Kakao",
    icon:"🍫",
    rarity:"Epic",
    price:3800,
    time:110,
    value:5100
  },

  {
    id:"grape",
    name:"Druer",
    icon:"🍇",
    rarity:"Epic",
    price:4800,
    time:122,
    value:6500
  },

  {
    id:"mango",
    name:"Mango",
    icon:"🥭",
    rarity:"Epic",
    price:6000,
    time:135,
    value:8200
  },

  {
    id:"sakura",
    name:"Sakura",
    icon:"🌸",
    rarity:"Epic",
    price:7500,
    time:150,
    value:10500
  },

  {
    id:"crystal",
    name:"Krystall",
    icon:"💎",
    rarity:"Mythical",
    price:10000,
    time:170,
    value:14500
  },

  {
    id:"moonlily",
    name:"Månelilje",
    icon:"🌙",
    rarity:"Mythical",
    price:13000,
    time:190,
    value:19000
  },

  {
    id:"star_tree",
    name:"Stjernetreet",
    icon:"🌟",
    rarity:"Mythical",
    price:16500,
    time:215,
    value:24500
  },

  {
    id:"dream_flower",
    name:"Drømmeblomst",
    icon:"🌺",
    rarity:"Mythical",
    price:20000,
    time:240,
    value:30500
  },

  {
    id:"dragon_fruit",
    name:"Dragefrukt",
    icon:"🐉",
    rarity:"Exotic",
    price:25000,
    time:270,
    value:39000
  },

  {
    id:"infinity_tree",
    name:"Uendelig tre",
    icon:"♾️",
    rarity:"Exotic",
    price:32000,
    time:310,
    value:50000
  },

  {
    id:"celestial_lotus",
    name:"Himmelsk lotus",
    icon:"✨",
    rarity:"Exotic",
    price:40000,
    time:360,
    value:64000
  },

  {
    id:"world_tree",
    name:"Verdstreet",
    icon:"🌳",
    rarity:"Legendary",
    price:55000,
    time:420,
    value:90000
  },

  {
    id:"ancient_zen_tree",
    name:"Det eldgamle Zen-treet",
    icon:"🌲",
    rarity:"Legendary",
    price:75000,
    time:500,
    value:125000
  }

];


/* =========================================================
   KJÆLEDYR
========================================================= */

const PETS=[

  {
    id:"snail",
    name:"Snegl",
    icon:"🐌",
    rarity:"Common",
    price:500,
    bonus:"+5% vekst",
    growth:.05
  },

  {
    id:"bee",
    name:"Honningbie",
    icon:"🐝",
    rarity:"Common",
    price:900,
    bonus:"+5% penger",
    money:.05
  },

  {
    id:"butterfly",
    name:"Sommerfugl",
    icon:"🦋",
    rarity:"Uncommon",
    price:1800,
    bonus:"+5% mutasjon",
    mutation:.05
  },

  {
    id:"rabbit",
    name:"Kanin",
    icon:"🐇",
    rarity:"Uncommon",
    price:2400,
    bonus:"+8% vekst",
    growth:.08
  },

  {
    id:"frog",
    name:"Frosk",
    icon:"🐸",
    rarity:"Rare",
    price:4000,
    bonus:"+35% regnlengde",
    rain:.35
  },

  {
    id:"spirit_fox",
    name:"Ånderev",
    icon:"🦊",
    rarity:"Epic",
    price:7000,
    bonus:"+8% penger",
    money:.08
  },

  {
    id:"owl",
    name:"Ugle",
    icon:"🦉",
    rarity:"Mythical",
    price:12000,
    bonus:"+15% nattvekst",
    night:.15
  },

  {
    id:"tiny_dragon",
    name:"Liten drage",
    icon:"🐲",
    rarity:"Exotic",
    price:20000,
    bonus:"+10% boss-skade",
    boss:.10
  },

  {
    id:"garden_unicorn",
    name:"Hageenhjørning",
    icon:"🦄",
    rarity:"Legendary",
    price:35000,
    bonus:"+10% alt",
    all:.10
  }

];


/* =========================================================
   BOSS-KJÆLEDYR
========================================================= */

const BOSS_PETS=[

  {
    id:"guardian_spirit",
    name:"Guardian Spirit",
    icon:"🛡️",
    rarity:"Uncommon",
    bonus:"+5% vekst",
    growth:.05
  },

  {
    id:"stone_spirit",
    name:"Stone Spirit",
    icon:"🪨",
    rarity:"Rare",
    bonus:"+8% penger",
    money:.08
  },

  {
    id:"shadow_spirit",
    name:"Shadow Spirit",
    icon:"🌑",
    rarity:"Epic",
    bonus:"+8% mutasjon",
    mutation:.08
  },

  {
    id:"dragon_spirit",
    name:"Dragon Spirit",
    icon:"🐉",
    rarity:"Mythical",
    bonus:"+10% boss-skade",
    boss:.10
  },

  {
    id:"ancient_spirit",
    name:"Ancient Spirit",
    icon:"👻",
    rarity:"Exotic",
    bonus:"+10% vekst",
    growth:.10
  },

  {
    id:"zen_king_spirit",
    name:"Zen King Spirit",
    icon:"👑",
    rarity:"Legendary",
    bonus:"+12% alt",
    all:.12
  }

];


/* =========================================================
   BOSSer
========================================================= */

const BOSSES=[

  {
    id:"guardian",
    name:"Garden Guardian",
    icon:"🗿",
    hp:5000,
    reward:2000,
    pet:"guardian_spirit"
  },

  {
    id:"stone",
    name:"Stone Giant",
    icon:"🪨",
    hp:12000,
    reward:7500,
    pet:"stone_spirit"
  },

  {
    id:"shadow",
    name:"Shadow Lord",
    icon:"🌑",
    hp:50000,
    reward:20000,
    pet:"shadow_spirit"
  },

  {
    id:"dragon",
    name:"Dragon Lord",
    icon:"🐉",
    hp:150000,
    reward:50000,
    pet:"dragon_spirit"
  },

  {
    id:"ancient",
    name:"Ancient One",
    icon:"👻",
    hp:500000,
    reward:150000,
    pet:"ancient_spirit"
  },

  {
    id:"zenking",
    name:"Zen King",
    icon:"👑",
    hp:2000000,
    reward:500000,
    pet:"zen_king_spirit"
  }

];


/* =========================================================
   VÆR
========================================================= */

const WEATHER={

  Clear:{
    icon:"☀️",
    name:"Klar",
    growth:1,
    value:1
  },

  Rain:{
    icon:"🌧️",
    name:"Regn",
    growth:1.25,
    value:1.1
  },

  Storm:{
    icon:"⛈️",
    name:"Storm",
    growth:1.4,
    value:1.2
  },

  Frost:{
    icon:"❄️",
    name:"Frost",
    growth:.65,
    value:.8
  },

  Fog:{
    icon:"🌫️",
    name:"Tåke",
    growth:.9,
    value:.95
  },

  Rainbow:{
    icon:"🌈",
    name:"Regnbue",
    growth:1.6,
    value:1.5
  }

};


/* =========================================================
   EVENT
========================================================= */

const EVENTS={

  sakura:{
    id:"sakura",
    name:"Sakura",
    icon:"🌸",
    chance:.001,
    min:60,
    max:120,
    text:"🌸 Vekst ×1,7 • nattvekst ×2 • penger ×1,5 • boss-skade ×2 • mutasjon +10%",
    growth:1.7,
    nightGrowth:2,
    money:1.5,
    boss:2,
    mutation:.10
  },

  golden:{
    id:"golden",
    name:"Golden Breeze",
    icon:"🍃",
    chance:.0018,
    min:45,
    max:90,
    text:"🍃 Penger ×2",
    money:2
  },

  firefly:{
    id:"firefly",
    name:"Firefly Night",
    icon:"✨",
    chance:.0015,
    min:60,
    max:120,
    text:"✨ Nattvekst ×2",
    nightGrowth:2
  },

  koi:{
    id:"koi",
    name:"Koi Blessing",
    icon:"🐟",
    chance:.0015,
    min:60,
    max:120,
    text:"🐟 Mutasjonsbonus +12%",
    mutation:.12
  }

};


/* =========================================================
   UPGRADES
========================================================= */

const UPGRADE_INFO={

  petSlots:{
    name:"Kjæledyr-slots",
    icon:"🐾",
    desc:"Hvor mange vanlige kjæledyr du kan utstyre.",
    cost:[1000,3000,8000,18000,40000]
  },

  fasterGrowth:{
    name:"Raskere vekst",
    icon:"⚡",
    desc:"+10% vekst per nivå.",
    cost:[800,2000,5000,12000,25000]
  },

  shorterGrowth:{
    name:"Kortere plantevekst",
    icon:"⏱️",
    desc:"Gjør nødvendig veksttid kortere.",
    cost:[1000,2500,6000,15000,30000]
  },

  betterWeather:{
    name:"Bedre vær",
    icon:"🌦️",
    desc:"Øker sjansen for gode værtyper.",
    cost:[1200,3000,7000,16000,35000]
  },

  mutationChance:{
    name:"Mutation-sjanse",
    icon:"✨",
    desc:"Øker sjansen for mutasjon.",
    cost:[1500,4000,9000,20000,45000]
  },

  moneyMultiplier:{
    name:"Pengemultiplikator",
    icon:"💰",
    desc:"Øker hvor mye penger du får.",
    cost:[2000,5000,12000,30000,60000]
  }

};


/* =========================================================
   STATE
========================================================= */

let state=createFreshState();
let gameRunning=false;
let tickTimer=null;
let lastRender=0;


function createFreshState(){

  return {

    version:SAVE_VERSION,

    username:"",

    money:1000,

    rebirths:0,

    plots:1,

    plants:Array(MAX_PLOTS).fill(null),

    inventory:{
      carrot:0
    },

    ownedPets:[],

    activePets:[],

    defeatedBosses:[],

    upgrades:{
      petSlots:0,
      fasterGrowth:0,
      shorterGrowth:0,
      betterWeather:0,
      mutationChance:0,
      moneyMultiplier:0
    },

    weather:"Clear",

    weatherEnds:Date.now()+60000,

    dayTime:.25,

    currentBossHP:null,

    needsRebirth:false,

    activeEvent:null,

    eventEnds:0,

    lastEventMinute:Math.floor(Date.now()/60000),

    lastTick:Date.now()

  };
}


/* =========================================================
   HJELPEFUNKSJONER
========================================================= */

function fmt(n){
  return Math.floor(n).toLocaleString("nb-NO");
}

function getSeed(id){
  return SEEDS.find(x=>x.id===id);
}

function getPet(id){
  return SEEDS.find(x=>x.id===id)
    ?null
    :PETS.find(x=>x.id===id)
    ||BOSS_PETS.find(x=>x.id===id);
}

function rarityClass(r){
  return String(r).toLowerCase();
}

function randomInt(min,max){
  return Math.floor(
    Math.random()*(max-min+1)
  )+min;
}

function clamp(n,min,max){
  return Math.max(min,Math.min(max,n));
}

function weightedChoice(items){

  const total=items.reduce(
    (sum,item)=>sum+item.weight,
    0
  );

  let roll=Math.random()*total;

  for(const item of items){

    roll-=item.weight;

    if(roll<=0){
      return item.item;
    }

  }

  return items[items.length-1].item;
}


/* =========================================================
   SAVE
========================================================= */

function save(){

  state.version=SAVE_VERSION;
  state.lastTick=Date.now();

  localStorage.setItem(
    SAVE_KEY,
    JSON.stringify(state)
  );

  localStorage.setItem(
    NICKNAME_KEY,
    state.username||""
  );
}


/* =========================================================
   MIGRERING
========================================================= */

function migrate(raw){

  const fresh=createFreshState();

  if(!raw || typeof raw!=="object"){
    return fresh;
  }

  const s={
    ...fresh,
    ...raw
  };

  s.version=SAVE_VERSION;

  s.username=
    raw.username
    ||localStorage.getItem(NICKNAME_KEY)
    ||"";

  s.money=Number(raw.money)||0;

  s.rebirths=Number(raw.rebirths)||0;

  if(raw.plots!=null){

    s.plots=clamp(
      Number(raw.plots)||1,
      1,
      MAX_PLOTS
    );

  }else if(raw.unlockedSlots!=null){

    s.plots=clamp(
      Number(raw.unlockedSlots)||1,
      1,
      MAX_PLOTS
    );

  }

  s.plants=Array(MAX_PLOTS).fill(null);

  if(Array.isArray(raw.plants)){

    for(
      let i=0;
      i<Math.min(MAX_PLOTS,raw.plants.length);
      i++
    ){

      const p=raw.plants[i];

      if(!p)continue;

      const seed=getSeed(
        p.plantId
        ||p.id
        ||p.seedId
      );

      if(seed){

        s.plants[i]={

          plantId:seed.id,

          progress:Number(p.progress)||0,

          mutation:p.mutation||null

        };

      }

    }

  }

  s.inventory={
    ...fresh.inventory,
    ...(raw.inventory||{})
  };

  s.ownedPets=
    Array.isArray(raw.ownedPets)
    ?raw.ownedPets.filter(
      p=>PETS.some(x=>x.id===p)
    )
    :[];

  if(Array.isArray(raw.activePets)){

    s.activePets=
      raw.activePets.filter(
        p=>s.ownedPets.includes(p)
      );

  }else if(raw.activePet){

    s.activePets=
      s.ownedPets.includes(raw.activePet)
      ?[raw.activePet]
      :[];

  }

  s.defeatedBosses=
    Array.isArray(raw.defeatedBosses)
    ?raw.defeatedBosses.filter(
      id=>BOSSES.some(b=>b.id===id)
    )
    :[];

  const oldUpgrades=
    raw.upgrades
    ||raw.zenUpgrades
    ||{};

  s.upgrades={
    ...fresh.upgrades,
    ...oldUpgrades
  };

  for(const key of Object.keys(s.upgrades)){

    s.upgrades[key]=clamp(
      Number(s.upgrades[key])||0,
      0,
      5
    );

  }

  if(WEATHER[raw.weather]){
    s.weather=raw.weather;
  }

  s.weatherEnds=
    Number(raw.weatherEnds)
    ||Date.now()+60000;

  s.dayTime=
    Number(raw.dayTime);

  if(!Number.isFinite(s.dayTime)){
    s.dayTime=.25;
  }

  s.currentBossHP=
    raw.currentBossHP==null
    ?null
    :Number(raw.currentBossHP);

  s.needsRebirth=
    !!raw.needsRebirth;

  if(
    raw.activeEvent
    &&EVENTS[raw.activeEvent.id]
  ){

    s.activeEvent=raw.activeEvent;

  }else{

    s.activeEvent=null;

  }

  s.eventEnds=
    Number(raw.eventEnds)||0;

  s.lastEventMinute=
    Number(raw.lastEventMinute)
    ||Math.floor(Date.now()/60000);

  s.lastTick=
    Number(raw.lastTick)
    ||Date.now();

  const boss=getCurrentBossFromState(s);

  if(
    !s.currentBossHP
    &&boss
    &&!s.needsRebirth
  ){

    s.currentBossHP=boss.hp;

  }

  return s;
}


function getCurrentBossFromState(s){

  if(s.needsRebirth){
    return null;
  }

  return BOSSES.find(
    b=>!s.defeatedBosses.includes(b.id)
  )||null;
}


/* =========================================================
   LOAD
========================================================= */

function load(){

  const raw=localStorage.getItem(SAVE_KEY);

  if(raw){

    try{

      state=migrate(
        JSON.parse(raw)
      );

    }catch(error){

      console.error(error);

      state=createFreshState();

    }

  }else{

    state=createFreshState();

    state.username=
      localStorage.getItem(NICKNAME_KEY)||"";

  }

  applyOfflineProgress();

  if(!state.username){

    showStart();

  }else{

    updateStartScreen();

  }

}


/* =========================================================
   NULLSTILL
========================================================= */

function resetProgress(){

  if(!confirm(
    "Er du sikker på at du vil nullstille fremgangen? Kallenavnet beholdes."
  )){
    return;
  }

  const name=
    localStorage.getItem(NICKNAME_KEY)
    ||state.username
    ||"";

  localStorage.removeItem(SAVE_KEY);

  state=createFreshState();

  state.username=name;

  save();

  closeModal();

  showToast(
    "🔄 Fremgangen er nullstilt. Kallenavnet er beholdt."
  );

  updateStartScreen();
}


function changeName(){

  const name=prompt(
    "Nytt kallenavn:",
    state.username||""
  );

  if(name&&name.trim()){

    state.username=
      name.trim().slice(0,20);

    save();

    updateStartScreen();

    if(gameRunning){
      render();
    }

  }

}


/* =========================================================
   START
========================================================= */

function showStart(){

  document
    .getElementById("startScreen")
    .classList.remove("hidden");

  document
    .getElementById("game")
    .classList.add("hidden");

  updateStartScreen();
}


function updateStartScreen(){

  const name=
    localStorage.getItem(NICKNAME_KEY)
    ||state.username;

  if(
    name
    &&localStorage.getItem(SAVE_KEY)
  ){

    document
      .getElementById("newGameArea")
      .classList.add("hidden");

    document
      .getElementById("existingArea")
      .classList.remove("hidden");

    document
      .getElementById("savedName")
      .textContent=name;

  }else{

    document
      .getElementById("newGameArea")
      .classList.remove("hidden");

    document
      .getElementById("existingArea")
      .classList.add("hidden");

    document
      .getElementById("nicknameInput")
      .value=name||"";

  }

}


function startGame(){

  let name=
    document
      .getElementById("nicknameInput")
      .value
      .trim();

  if(!name){

    name=
      localStorage.getItem(NICKNAME_KEY)
      ||"OLO";

  }

  state.username=
    name.slice(0,20);

  save();

  document
    .getElementById("startScreen")
    .classList.add("hidden");

  document
    .getElementById("game")
    .classList.remove("hidden");

  gameRunning=true;

  render();

  setupWeatherVisuals();

  if(!tickTimer){

    tickTimer=setInterval(
      gameTick,
      1000
    );

  }

}


function showHomeMenu(){

  closeModal();

  document
    .getElementById("game")
    .classList.add("hidden");

  document
    .getElementById("startScreen")
    .classList.remove("hidden");

  gameRunning=false;

  updateStartScreen();

}


/* =========================================================
   TOMTER
========================================================= */

function plotPrice(index){

  return Math.floor(
    500*Math.pow(1.45,index)
  );

}


function buyPlot(index){

  if(index!==state.plots){
    return;
  }

  if(state.plots>=MAX_PLOTS){

    showToast(
      "🌱 Du har alle 30 tomtene!"
    );

    return;
  }

  const price=plotPrice(index);

  if(state.money<price){

    showToast(
      `💰 Du trenger ${fmt(price)} penger.`
    );

    return;
  }

  state.money-=price;

  state.plots++;

  save();

  render();

  showToast(
    `🌱 Tomt ${index+1} er kjøpt!`
  );

}


/* =========================================================
   PLANTE
========================================================= */

function plantPlot(index){

  if(index>=state.plots){
    return;
  }

  const plot=state.plants[index];

  if(plot){

    if(isPlantReady(plot)){

      harvest(index);

    }else{

      showToast(
        "🌱 Denne planten vokser fortsatt."
      );

    }

    return;
  }

  openPlantChooser(index);

}


function openPlantChooser(index){

  const available=
    SEEDS.filter(
      seed=>(state.inventory[seed.id]||0)>0
    );

  if(!available.length){

    showToast(
      "🌱 Du har ingen frø. Åpne Zen Shop!"
    );

    openShop();

    return;
  }

  document
    .getElementById("modalTitle")
    .textContent=
      `🌱 Velg frø til Tomt ${index+1}`;

  document
    .getElementById("modalContent")
    .innerHTML=`

      <div class="shop-grid">

        ${available.map(seed=>`

          <div class="card">

            <div class="seed-icon">
              ${seed.icon}
            </div>

            <h3>
              ${seed.name}
            </h3>

            <p class="${rarityClass(seed.rarity)}">
              Rarities: ${seed.rarity}
            </p>

            <p>
              Du har:
              ${state.inventory[seed.id]||0}
            </p>

            <p>
              Vekst:
              ${seed.time} sekunder
            </p>

            <button
              onclick="plantSeed(${index},'${seed.id}')"
            >
              🌱 Plant
            </button>

          </div>

        `).join("")}

      </div>

  `;

  document
    .getElementById("modal")
    .classList.remove("hidden");

}


function plantSeed(index,id){

  const seed=getSeed(id);

  if(!seed)return;

  if(index>=state.plots)return;

  if(state.plants[index])return;

  if((state.inventory[id]||0)<=0){

    showToast(
      "Du har ikke dette frøet."
    );

    return;
  }

  state.inventory[id]--;

  state.plants[index]={

    plantId:id,

    progress:0,

    mutation:null

  };

  save();

  closeModal();

  render();

  showToast(
    `${seed.icon} ${seed.name} er plantet!`
  );

}


function isPlantReady(plot){

  const seed=getSeed(plot.plantId);

  return !!seed
    &&plot.progress>=seed.time;

}


/* =========================================================
   MUTASJON
========================================================= */

function getMutationChance(){

  let chance=.075;

  chance*=
    1+0.12*state.upgrades.mutationChance;

  for(const id of state.activePets){

    const pet=getPet(id);

    if(!pet)continue;

    chance+=pet.mutation||0;

    if(pet.all){
      chance+=pet.all*.5;
    }

  }

  for(const bossId of state.defeatedBosses){

    const boss=
      BOSSES.find(
        b=>b.id===bossId
      );

    const pet=
      boss
      ?getPet(boss.pet)
      :null;

    if(!pet)continue;

    chance+=pet.mutation||0;

    if(pet.all){
      chance+=pet.all*.5;
    }

  }

  if(state.activeEvent){

    const event=
      EVENTS[state.activeEvent.id];

    if(event){
      chance+=event.mutation||0;
    }

  }

  return Math.min(
    .5,
    chance
  );

}


function rollMutation(){

  if(
    Math.random()>getMutationChance()
  ){
    return null;
  }

  const roll=Math.random();

  if(roll<.067){

    return {
      name:"Celestial",
      icon:"✨",
      multiplier:8,
      class:"exotic"
    };

  }

  if(roll<.333){

    return {
      name:"Regnbue",
      icon:"🌈",
      multiplier:4,
      class:"rainbow"
    };

  }

  return {
    name:"Golden",
    icon:"🌟",
    multiplier:2,
    class:"legendary"
  };

}


/* =========================================================
   HØSTING
========================================================= */

function harvest(index){

  const plot=state.plants[index];

  if(!plot)return;

  const seed=getSeed(plot.plantId);

  if(!seed)return;

  if(!isPlantReady(plot)){

    showToast(
      "⏳ Planten er ikke klar ennå!"
    );

    return;
  }

  if(!plot.mutation){

    plot.mutation=
      rollMutation();

  }

  let amount=seed.value;

  if(plot.mutation){

    amount*=
      plot.mutation.multiplier;

  }

  amount*=
    getValueMultiplier();

  amount=Math.floor(amount);

  state.plants[index]=null;

  earnMoney(
    amount,
    true
  );

  save();

  render();

  let message=
    `${seed.icon} ${seed.name}: +${fmt(amount)} penger`;

  if(plot.mutation){

    message+=
      ` ${plot.mutation.icon} ${plot.mutation.name}!`;

  }

  showToast(message);

}


/* =========================================================
   PENGER
========================================================= */

function getValueMultiplier(){

  let multiplier=
    WEATHER[state.weather]?.value||1;

  multiplier*=
    1+0.10*state.upgrades.moneyMultiplier;

  for(const id of state.activePets){

    const pet=getPet(id);

    if(!pet)continue;

    multiplier+=pet.money||0;

    if(pet.all){
      multiplier+=pet.all;
    }

  }

  for(const bossId of state.defeatedBosses){

    const boss=
      BOSSES.find(
        b=>b.id===bossId
      );

    const pet=
      boss
      ?getPet(boss.pet)
      :null;

    if(!pet)continue;

    multiplier+=pet.money||0;

    if(pet.all){
      multiplier+=pet.all;
    }

  }

  if(state.activeEvent){

    const event=
      EVENTS[state.activeEvent.id];

    if(event){

      multiplier*=
        event.money||1;

    }

  }

  return multiplier;

}


function earnMoney(amount,damageBoss=true){

  amount=
    Math.max(
      0,
      Math.floor(amount)
    );

  state.money+=amount;

  if(
    damageBoss
    &&amount>0
  ){

    damageBossFromMoney(amount);

  }

  return amount;

}


/* =========================================================
   BOSS
========================================================= */

function getCurrentBoss(){

  if(state.needsRebirth){
    return null;
  }

  return BOSSES.find(
    b=>!state.defeatedBosses.includes(b.id)
  )||null;

}


function getBossDamageMultiplier(){

  let multiplier=1;

  for(const id of state.activePets){

    const pet=getPet(id);

    if(!pet)continue;

    multiplier+=pet.boss||0;

    if(pet.all){
      multiplier+=pet.all;
    }

  }

  for(const bossId of state.defeatedBosses){

    const boss=
      BOSSES.find(
        b=>b.id===bossId
      );

    const pet=
      boss
      ?getPet(boss.pet)
      :null;

    if(!pet)continue;

    multiplier+=pet.boss||0;

    if(pet.all){
      multiplier+=pet.all;
    }

  }

  if(state.activeEvent){

    const event=
      EVENTS[state.activeEvent.id];

    if(event){

      multiplier*=
        event.boss||1;

    }

  }

  return multiplier;

}


function damageBossFromMoney(amount){

  const boss=getCurrentBoss();

  if(
    !boss
    ||state.needsRebirth
  ){
    return;
  }

  if(state.currentBossHP==null){

    state.currentBossHP=
      boss.hp;

  }

  const damage=Math.max(
    1,
    Math.floor(
      amount*
      getBossDamageMultiplier()
    )
  );

  state.currentBossHP-=damage;

  if(state.currentBossHP<=0){

    defeatCurrentBoss();

  }

}


function defeatCurrentBoss(){

  const boss=getCurrentBoss();

  if(!boss)return;

  state.currentBossHP=0;

  state.defeatedBosses.push(
    boss.id
  );

  state.needsRebirth=true;

  state.currentBossHP=null;

  earnMoney(
    boss.reward,
    false
  );

  const pet=getPet(boss.pet);

  save();

  render();

  showToast(
    `👑 ${boss.name} er beseiret! ${pet.icon} ${pet.name} er nå permanent ditt!`
  );

}


/* =========================================================
   VEKST
========================================================= */

function isNight(){

  return state.dayTime>.72
    ||state.dayTime<.18;

}


function getGrowthRate(){

  let rate=
    WEATHER[state.weather]?.growth||1;

  rate*=
    1+0.10*state.upgrades.fasterGrowth;

  rate/=
    Math.max(
      .5,
      1-0.05*state.upgrades.shorterGrowth
    );

  for(const id of state.activePets){

    const pet=getPet(id);

    if(!pet)continue;

    rate+=pet.growth||0;

    if(isNight()){
      rate+=pet.night||0;
    }

    if(pet.all){
      rate+=pet.all;
    }

  }

  for(const bossId of state.defeatedBosses){

    const boss=
      BOSSES.find(
        b=>b.id===bossId
      );

    const pet=
      boss
      ?getPet(boss.pet)
      :null;

    if(!pet)continue;

    rate+=pet.growth||0;

    if(isNight()){
      rate+=pet.night||0;
    }

    if(pet.all){
      rate+=pet.all;
    }

  }

  if(isNight()){
    rate*=.9;
  }

  if(state.activeEvent){

    const event=
      EVENTS[state.activeEvent.id];

    if(event){

      rate*=
        event.growth||1;

      if(isNight()){

        rate*=
          event.nightGrowth||1;

      }

    }

  }

  return rate;

}


/* =========================================================
   OFFLINE
========================================================= */

function applyOfflineProgress(){

  const now=Date.now();

  let elapsed=
    (now-(state.lastTick||now))
    /1000;

  if(
    !Number.isFinite(elapsed)
    ||elapsed<0
  ){
    elapsed=0;
  }

  elapsed=
    Math.min(
      elapsed,
      8*60*60
    );

  if(elapsed>0){

    for(const plot of state.plants){

      if(!plot)continue;

      const seed=
        getSeed(plot.plantId);

      if(!seed)continue;

      plot.progress+=
        elapsed*
        getGrowthRate();

      if(plot.progress>seed.time){

        plot.progress=
          seed.time;

      }

    }

  }

  state.lastTick=now;

}


/* =========================================================
   VÆR
========================================================= */

function weatherDuration(){

  let duration=
    randomInt(35,95);

  if(state.weather==="Rain"){

    let frogBonus=0;

    for(const id of state.activePets){

      const pet=getPet(id);

      if(pet?.rain){

        frogBonus+=pet.rain;

      }

    }

    duration=
      Math.floor(
        duration*
        (1+frogBonus)
      );

  }

  return duration;

}


function weatherWeights(){

  const level=
    state.upgrades.betterWeather;

  return [

    {
      item:"Clear",
      weight:1
    },

    {
      item:"Rain",
      weight:1+.18*level
    },

    {
      item:"Storm",
      weight:1+.10*level
    },

    {
      item:"Frost",
      weight:Math.max(
        .25,
        1-.15*level
      )
    },

    {
      item:"Fog",
      weight:1
    },

    {
      item:"Rainbow",
      weight:1+.08*level
    }

  ];

}


function chooseWeather(){

  return weightedChoice(
    weatherWeights()
  );

}


function setWeather(weather){

  state.weather=weather;

  state.weatherEnds=
    Date.now()+
    weatherDuration()*1000;

  clearWeatherVisuals();

  setupWeatherVisuals();

  save();

  render();

}


/* =========================================================
   VÆR-VISUALS
========================================================= */

function clearWeatherVisuals(){

  const layer=
    document.getElementById(
      "weatherLayer"
    );

  layer.innerHTML="";

}


function setupWeatherVisuals(){

  clearWeatherVisuals();

  const layer=
    document.getElementById(
      "weatherLayer"
    );

  /* REGN OG STORM */

  if(
    state.weather==="Rain"
    ||state.weather==="Storm"
  ){

    for(let i=0;i<55;i++){

      const drop=
        document.createElement("div");

      drop.className=
        "rain-drop";

      drop.style.left=
        Math.random()*100+"%";

      drop.style.animationDuration=
        (.45+Math.random()*.6)+"s";

      drop.style.animationDelay=
        (-Math.random()*2)+"s";

      layer.appendChild(drop);

    }

    if(state.weather==="Storm"){

      const flash=
        document.createElement("div");

      flash.className=
        "lightning";

      layer.appendChild(flash);

    }

  }

  /* FROST */

  if(state.weather==="Frost"){

    for(let i=0;i<45;i++){

      const snow=
        document.createElement("div");

      snow.className="snow";

      snow.style.left=
        Math.random()*100+"%";

      snow.style.animationDuration=
        (4+Math.random()*7)+"s";

      snow.style.animationDelay=
        (-Math.random()*8)+"s";

      layer.appendChild(snow);

    }

  }

  /* TÅKE */

  if(state.weather==="Fog"){

    for(let i=0;i<4;i++){

      const fog=
        document.createElement("div");

      fog.className="fog";

      fog.style.top=
        (10+i*22)+"%";

      fog.style.left=
        (-30+i*20)+"%";

      fog.style.animationDelay=
        (-i*4)+"s";

      layer.appendChild(fog);

    }

  }

  /* KLARVÆR */

  if(state.weather==="Clear"){

    for(let i=0;i<20;i++){

      const particle=
        document.createElement("div");

      particle.className=
        "sun-particle";

      particle.style.left=
        Math.random()*100+"%";

      particle.style.top=
        Math.random()*100+"%";

      particle.style.animationDelay=
        Math.random()*5+"s";

      layer.appendChild(particle);

    }

  }

  /* REGNBUE V5.5 */

  if(state.weather==="Rainbow"){

    const rainbow=
      document.createElement("div");

    rainbow.className=
      "rainbow-overlay";

    layer.appendChild(rainbow);

  }

}


/* =========================================================
   EVENT
========================================================= */

function eventDuration(event){

  return randomInt(
    event.min,
    event.max
  );

}


function checkEventMinute(){

  const minute=
    Math.floor(
      Date.now()/60000
    );

  if(
    minute===state.lastEventMinute
  ){
    return;
  }

  state.lastEventMinute=minute;

  if(state.activeEvent){
    save();
    return;
  }

  const choices=[

    EVENTS.sakura,
    EVENTS.golden,
    EVENTS.firefly,
    EVENTS.koi

  ];

  for(const event of choices){

    if(
      Math.random()<
      event.chance
    ){

      state.activeEvent={

        id:event.id,

        started:Date.now()

      };

      state.eventEnds=
        Date.now()+
        eventDuration(event)*1000;

      showToast(
        `${event.icon} ${event.name} har startet!`
      );

      renderEventVisual();

      save();

      return;

    }

  }

  save();

}


function updateEvent(){

  if(!state.activeEvent){
    return;
  }

  if(
    Date.now()>=state.eventEnds
  ){

    const old=
      EVENTS[state.activeEvent.id];

    state.activeEvent=null;

    state.eventEnds=0;

    document
      .getElementById("eventVisual")
      .innerHTML="";

    showToast(
      `${old?.icon||"🎉"} ${old?.name||"Event"} er ferdig.`
    );

    save();

  }

}


/* =========================================================
   EVENT-VISUAL
========================================================= */

function renderEventVisual(){

  const root=
    document.getElementById(
      "eventVisual"
    );

  root.innerHTML="";

  if(!state.activeEvent){
    return;
  }

  const event=
    EVENTS[state.activeEvent.id];

  if(event.id==="sakura"){

    const tree=
      document.createElement("div");

    tree.className=
      "sakura-tree";

    tree.innerHTML=`

      <div class="trunk"></div>

      <div class="branch b1"></div>

      <div class="branch b2"></div>

      <div class="branch b3"></div>

      <div class="blossom b01"></div>
      <div class="blossom b02"></div>
      <div class="blossom b03"></div>
      <div class="blossom b04"></div>
      <div class="blossom b05"></div>
      <div class="blossom b06"></div>
      <div class="blossom b07"></div>
      <div class="blossom b08"></div>
      <div class="blossom b09"></div>

    `;

    root.appendChild(tree);

    for(let i=0;i<28;i++){

      const petal=
        document.createElement("div");

      petal.className=
        "petal";

      petal.style.left=
        Math.random()*100+"%";

      petal.style.top=
        Math.random()*20+"%";

      petal.style.animationDelay=
        (-Math.random()*5)+"s";

      petal.style.animationDuration=
        (3+Math.random()*5)+"s";

      root.appendChild(petal);

    }

  }

  if(event.id==="firefly"){

    for(let i=0;i<35;i++){

      const firefly=
        document.createElement("div");

      firefly.className=
        "sun-particle";

      firefly.style.left=
        Math.random()*100+"%";

      firefly.style.top=
        Math.random()*100+"%";

      firefly.style.background=
        "#e9ff70cc";

      firefly.style.boxShadow=
        "0 0 15px #faff70";

      root.appendChild(firefly);

    }

  }

}


/* =========================================================
   DAG / NATT
========================================================= */

function updateDay(delta){

  const cycle=180;

  state.dayTime=
    (
      state.dayTime+
      delta/cycle
    )%1;

}


/* =========================================================
   GAME TICK
========================================================= */

function gameTick(){

  if(!gameRunning){
    return;
  }

  const now=Date.now();

  let delta=
    (now-state.lastTick)/1000;

  if(
    !Number.isFinite(delta)
    ||delta<0
  ){

    delta=1;

  }

  delta=
    Math.min(delta,5);

  state.lastTick=now;

  updateDay(delta);

  for(const plot of state.plants){

    if(!plot)continue;

    const seed=
      getSeed(plot.plantId);

    if(seed){

      plot.progress+=
        delta*
        getGrowthRate();

      if(plot.progress>seed.time){

        plot.progress=
          seed.time;

      }

    }

  }

  if(
    now>=state.weatherEnds
  ){

    setWeather(
      chooseWeather()
    );

  }

  updateEvent();

  checkEventMinute();

  if(state.activeEvent){

    renderEventVisual();

  }

  if(
    now-lastRender>500
  ){

    render();

    lastRender=now;

  }

  if(
    now%5000<1000
  ){

    save();

  }

}


/* =========================================================
   ZEN SHOP
========================================================= */

function openShop(){

  document
    .getElementById("modalTitle")
    .textContent=
      "🛒 Zen Shop";

  document
    .getElementById("modalContent")
    .innerHTML=`

      <div class="shop-money">
        💰 Du har:
        <span>${fmt(state.money)}</span>
        penger
      </div>

      <p style="color:#d6c6a8">
        🌱 Kjøp frø her.
        Tomter kjøpes direkte i hagen
        ved å klikke på låste tomter.
      </p>

      <div class="shop-grid">

        ${SEEDS.map(seed=>`

          <div class="card">

            <div class="seed-icon">
              ${seed.icon}
            </div>

            <h3>
              ${seed.name}
            </h3>

            <div
              class="rarity ${rarityClass(seed.rarity)}"
            >
              Rarities: ${seed.rarity}
            </div>

            <p>
              Vekst:
              ${seed.time}s
            </p>

            <p>
              Verdi:
              ${fmt(seed.value)} penger
            </p>

            <p>
              Pris:
              <b>
                ${fmt(seed.price)} penger
              </b>
            </p>

            <p>
              Du har:
              ${state.inventory[seed.id]||0}
            </p>

            <button
              onclick="buySeed('${seed.id}')"
            >
              🌱 Kjøp frø
            </button>

          </div>

        `).join("")}

      </div>

  `;

  document
    .getElementById("modal")
    .classList.remove("hidden");

}


function buySeed(id){

  const seed=getSeed(id);

  if(!seed)return;

  if(state.money<seed.price){

    showToast(
      "💰 Du har ikke nok penger."
    );

    return;

  }

  state.money-=seed.price;

  state.inventory[id]=
    (state.inventory[id]||0)+1;

  save();

  render();

  openShop();

  showToast(
    `${seed.icon} ${seed.name}-frø kjøpt!`
  );

}


/* =========================================================
   KJÆLEDYR
========================================================= */

function petEquipped(id){

  return state.activePets.includes(id);

}


function togglePet(id){

  if(!state.ownedPets.includes(id)){
    return;
  }

  const slots=
    state.upgrades.petSlots;

  if(slots<=0){

    showToast(
      "🐾 Kjøp først Kjæledyr-slots i Zen Upgrades!"
    );

    return;
  }

  if(petEquipped(id)){

    state.activePets=
      state.activePets.filter(
        x=>x!==id
      );

  }else{

    if(
      state.activePets.length>=slots
    ){

      showToast(
        `🐾 Du har bare ${slots} kjæledyr-slot(s).`
      );

      return;

    }

    state.activePets.push(id);

  }

  save();

  openPets();

  render();

}


function buyPet(id){

  const pet=
    PETS.find(
      x=>x.id===id
    );

  if(!pet)return;

  if(
    state.ownedPets.includes(id)
  ){

    togglePet(id);

    return;

  }

  if(state.money<pet.price){

    showToast(
      "💰 Du har ikke nok penger."
    );

    return;

  }

  state.money-=pet.price;

  state.ownedPets.push(id);

  save();

  render();

  openPets();

  showToast(
    `${pet.icon} ${pet.name} er kjøpt!`
  );

}


function openPets(){

  const slots=
    state.upgrades.petSlots;

  document
    .getElementById("modalTitle")
    .textContent=
      "🐾 Zen-kjæledyr";

  document
    .getElementById("modalContent")
    .innerHTML=`

      <div class="card" style="margin-bottom:20px">

        🐾 Utstyrte kjæledyr:
        <b>
          ${state.activePets.length}/${slots}
        </b>

        <br>

        <small>
          Spirit pets fra Boss er permanente
          og bruker ikke slots.
        </small>

      </div>

      <h2>
        🐾 Vanlige kjæledyr
      </h2>

      <div class="pet-grid">

        ${PETS.map(pet=>`

          <div class="card">

            <div class="seed-icon">
              ${pet.icon}
            </div>

            <h3>
              ${pet.name}
            </h3>

            <div
              class="rarity ${rarityClass(pet.rarity)}"
            >
              Rarities: ${pet.rarity}
            </div>

            <p>
              ${pet.bonus}
            </p>

            <p>
              Pris:
              ${fmt(pet.price)}
              penger
            </p>

            ${
              state.ownedPets.includes(pet.id)
              ?
              `
                <button
                  onclick="togglePet('${pet.id}')"
                >
                  ${
                    petEquipped(pet.id)
                    ?"❌ Ta av"
                    :"✅ Utstyr"
                  }
                </button>
              `
              :
              `
                <button
                  onclick="buyPet('${pet.id}')"
                >
                  🛒 Kjøp
                </button>
              `
            }

          </div>

        `).join("")}

      </div>

      <h2 style="margin-top:30px">
        👑 Spirit pets fra Boss
      </h2>

      <div class="pet-grid">

        ${BOSS_PETS.map(pet=>{

          const boss=
            BOSSES.find(
              b=>b.pet===pet.id
            );

          const owned=
            boss
            &&state.defeatedBosses.includes(
              boss.id
            );

          return `

            <div class="card">

              <div class="seed-icon">
                ${pet.icon}
              </div>

              <h3>
                ${pet.name}
              </h3>

              <div
                class="rarity ${rarityClass(pet.rarity)}"
              >
                Rarities: ${pet.rarity}
              </div>

              <p>
                ${pet.bonus}
              </p>

              <p>
                Boss:
                <b>${boss?.name||"?"}</b>
              </p>

              <button disabled>
                ${
                  owned
                  ?"👑 Permanent"
                  :"🔒 Beseir Bossen"
                }
              </button>

            </div>

          `;

        }).join("")}

      </div>

  `;

  document
    .getElementById("modal")
    .classList.remove("hidden");

}


/* =========================================================
   UPGRADES
========================================================= */

function upgradeCost(id){

  const upgrade=
    UPGRADE_INFO[id];

  const level=
    state.upgrades[id];

  if(level>=5){
    return Infinity;
  }

  return upgrade.cost[level];

}


function buyUpgrade(id){

  const level=
    state.upgrades[id];

  if(level>=5){

    showToast(
      "⚡ Denne upgraden er maks."
    );

    return;

  }

  const cost=
    upgradeCost(id);

  if(state.money<cost){

    showToast(
      "💰 Du har ikke nok penger."
    );

    return;

  }

  state.money-=cost;

  state.upgrades[id]++;

  save();

  render();

  openUpgrades();

  showToast(
    `⚡ ${UPGRADE_INFO[id].name} er nå nivå ${state.upgrades[id]}!`
  );

}


function openUpgrades(){

  document
    .getElementById("modalTitle")
    .textContent=
      "⚡ Zen Upgrades";

  document
    .getElementById("modalContent")
    .innerHTML=`

      <div class="upgrade-grid">

        ${Object.entries(UPGRADE_INFO)
          .map(([id,upgrade])=>{

            const level=
              state.upgrades[id];

            const max=
              level>=5;

            const cost=
              max
              ?0
              :upgradeCost(id);

            let extra="";

            if(id==="moneyMultiplier"){

              extra=`
                <p>
                  Penger:
                  ×${(1+.10*level).toFixed(2)}
                </p>
              `;

            }

            if(id==="petSlots"){

              extra=`
                <p>
                  Slots:
                  ${level}
                </p>
              `;

            }

            return `

              <div class="card">

                <div class="seed-icon">
                  ${upgrade.icon}
                </div>

                <h3>
                  ${upgrade.name}
                </h3>

                <p>
                  ${upgrade.desc}
                </p>

                ${extra}

                <p>
                  Nivå:
                  <b>${level}/5</b>
                </p>

                <div style="
                  height:10px;
                  background:#18241e;
                  border-radius:10px;
                  overflow:hidden;
                  margin:10px 0
                ">

                  <div style="
                    width:${level*20}%;
                    height:100%;
                    background:#c4a263
                  "></div>

                </div>

                <button
                  onclick="buyUpgrade('${id}')"
                  ${max?"disabled":""}
                >

                  ${
                    max
                    ?"✅ MAKS"
                    :"⚡ Oppgrader • "+
                     fmt(cost)+
                     " penger"
                  }

                </button>

              </div>

            `;

          }).join("")}

      </div>

  `;

  document
    .getElementById("modal")
    .classList.remove("hidden");

}


/* =========================================================
   BOSS-MENY
========================================================= */

function openBoss(){

  document
    .getElementById("modalTitle")
    .textContent=
      "👑 Boss";

  const current=
    getCurrentBoss();

  document
    .getElementById("modalContent")
    .innerHTML=`

      <div
        class="card"
        style="margin-bottom:20px"
      >

        ${
          state.needsRebirth

          ?

          `
            <h3>
              🔄 Boss beseiret!
            </h3>

            <p>
              Du må ta Rebirth før neste Boss
              blir aktiv.
            </p>

            <button
              onclick="closeModal();openRebirth()"
            >
              🔄 Gå til Rebirth
            </button>
          `

          :

          `
            <h3>
              ${current?.icon||"👑"}
              ${current?.name||"Alle Boss er beseiret!"}
            </h3>

            <p>
              💰 Hver 1 penger du tjener gir
              automatisk Boss-skade.
            </p>

            <p>
              🚫 Det finnes ingen manuell
              angrepsknapp.
            </p>
          `
        }

      </div>

      <div class="boss-grid">

        ${BOSSES.map((boss,index)=>{

          const defeated=
            state.defeatedBosses.includes(
              boss.id
            );

          const pet=
            getPet(boss.pet);

          return `

            <div class="card">

              <div class="seed-icon">
                ${boss.icon}
              </div>

              <h3>
                ${index+1}.
                ${boss.name}
              </h3>

              <p>
                HP:
                <b>${fmt(boss.hp)}</b>
              </p>

              <p>
                Belønning:
                <b>
                  ${fmt(boss.reward)}
                  penger
                </b>
              </p>

              <p>
                Kjæledyr:
                ${pet.icon}
                ${pet.name}
              </p>

              <div
                class="rarity ${rarityClass(pet.rarity)}"
              >
                Rarities:
                ${pet.rarity}
              </div>

              <button disabled>
                ${
                  defeated
                  ?"👑 Beseiret"
                  :"🔒 Venter"
                }
              </button>

            </div>

          `;

        }).join("")}

      </div>

  `;

  document
    .getElementById("modal")
    .classList.remove("hidden");

}


/* =========================================================
   REBIRTH
========================================================= */

function openRebirth(){

  document
    .getElementById("modalTitle")
    .textContent=
      "🔄 Rebirth";

  const next=
    state.rebirths+1;

  document
    .getElementById("modalContent")
    .innerHTML=`

      <div class="rebirth-box">

        <div style="font-size:70px">
          🌿
        </div>

        <h2>
          Rebirth #${next}
        </h2>

        <p>
          Rebirth nullstiller penger,
          planter, tomter, inventory og
          vanlige kjæledyr.
        </p>

        <p>
          Du beholder:
        </p>

        <p>
          👤 Kallenavn<br>
          🔄 Rebirth-tall<br>
          👑 Beseirede Boss<br>
          👻 Spirit pets<br>
          ⚡ Alle upgrades
        </p>

        <p>
          🥕 Etter Rebirth starter du alltid
          med 1 gulrot.
        </p>

        ${
          state.needsRebirth

          ?

          `
            <p style="color:#ffd65a">
              👑 Bossen er beseiret —
              du kan ta Rebirth nå!
            </p>
          `

          :

          `
            <p style="color:#cdbfa5">
              Du kan ta Rebirth når du vil.
            </p>
          `
        }

        <button
          class="rebirth-btn"
          onclick="doRebirth()"
        >
          🔄 Rebirth
        </button>

      </div>

  `;

  document
    .getElementById("modal")
    .classList.remove("hidden");

}


function doRebirth(){

  if(!confirm(
    "Ta Rebirth? Dette nullstiller hagen din."
  )){
    return;
  }

  const name=state.username;

  const rebirths=
    state.rebirths+1;

  const defeated=[
    ...state.defeatedBosses
  ];

  const upgrades={
    ...state.upgrades
  };

  state=createFreshState();

  state.username=name;

  state.rebirths=rebirths;

  state.defeatedBosses=
    defeated;

  state.upgrades=
    upgrades;

  /*
     V5.5:
     Etter Rebirth starter spilleren alltid
     med 1 gulrot i inventory.
  */

  state.inventory={
    carrot:1
  };

  state.ownedPets=[];

  state.activePets=[];

  save();

  closeModal();

  render();

  setupWeatherVisuals();

  showToast(
    `🌿 Rebirth #${rebirths} er fullført! 🥕 Du fikk 1 gulrot.`
  );

}


/* =========================================================
   MODAL
========================================================= */

function closeModal(){

  document
    .getElementById("modal")
    .classList.add("hidden");

}


/* =========================================================
   TOAST
========================================================= */

function showToast(text){

  const toast=
    document.getElementById("toast");

  toast.textContent=text;

  toast.classList.add("show");

  clearTimeout(
    showToast.timer
  );

  showToast.timer=
    setTimeout(()=>{

      toast.classList.remove("show");

    },2800);

}


/* =========================================================
   RENDER
========================================================= */

function render(){

  document
    .getElementById("brandName")
    .textContent=
      state.username||"OLO";

  document
    .getElementById("moneyDisplay")
    .textContent=
      fmt(state.money);

  document
    .getElementById("plotDisplay")
    .textContent=
      `${state.plots}/${MAX_PLOTS}`;

  document
    .getElementById("rebirthDisplay")
    .textContent=
      state.rebirths;

  renderTime();

  renderWeather();

  renderBoss();

  renderEvent();

  renderPlots();

}


/* =========================================================
   DAG / NATT RENDER
========================================================= */

function renderTime(){

  const night=
    isNight();

  document
    .getElementById("timeIcon")
    .textContent=
      night
      ?"🌙"
      :"☀️";

  document
    .getElementById("timeText")
    .textContent=
      night
      ?"Natt"
      :"Dag";

  document.body
    .classList.toggle(
      "night",
      night
    );

}


/* =========================================================
   VÆR RENDER
========================================================= */

function renderWeather(){

  const weather=
    WEATHER[state.weather];

  document
    .getElementById("weatherIcon")
    .textContent=
      weather.icon;

  document
    .getElementById("weatherName")
    .textContent=
      weather.name;

  const left=Math.max(
    0,
    Math.ceil(
      (state.weatherEnds-Date.now())
      /1000
    )
  );

  document
    .getElementById("weatherTimer")
    .textContent=
      left;

}


/* =========================================================
   BOSS RENDER
========================================================= */

function renderBoss(){

  const boss=
    getCurrentBoss();

  const fill=
    document.getElementById(
      "bossFill"
    );

  if(!boss){

    if(state.needsRebirth){

      document
        .getElementById("bossIcon")
        .textContent="👑";

      document
        .getElementById("bossName")
        .textContent=
          "Boss beseiret";

      document
        .getElementById("bossHP")
        .textContent=
          "REBIRTH";

      fill.style.width="100%";

    }else{

      document
        .getElementById("bossIcon")
        .textContent="🌟";

      document
        .getElementById("bossName")
        .textContent=
          "Alle Boss beseiret";

      document
        .getElementById("bossHP")
        .textContent=
          "MAKS";

      fill.style.width="100%";

    }

    return;
  }

  if(state.currentBossHP==null){

    state.currentBossHP=
      boss.hp;

  }

  const hp=
    Math.max(
      0,
      state.currentBossHP
    );

  document
    .getElementById("bossIcon")
    .textContent=
      boss.icon;

  document
    .getElementById("bossName")
    .textContent=
      boss.name;

  document
    .getElementById("bossHP")
    .textContent=
      fmt(hp);

  fill.style.width=
    clamp(
      hp/boss.hp*100,
      0,
      100
    )+"%";

}


/* =========================================================
   EVENT RENDER
========================================================= */

function renderEvent(){

  const text=
    document.getElementById(
      "eventText"
    );

  const timer=
    document.getElementById(
      "eventTimer"
    );

  if(!state.activeEvent){

    text.textContent=
      "🎉 Ingen Event akkurat nå.";

    timer.textContent="";

    document
      .getElementById("eventVisual")
      .innerHTML="";

    return;

  }

  const event=
    EVENTS[state.activeEvent.id];

  text.innerHTML=`

    ${event.icon}
    <b>${event.name}</b>
    <br>

    <span style="font-size:17px">
      ${event.text}
    </span>

  `;

  const left=Math.max(
    0,
    Math.ceil(
      (state.eventEnds-Date.now())
      /1000
    )
  );

  timer.textContent=
    `Varer i ${left}s`;

  renderEventVisual();

}


/* =========================================================
   PLOT RENDER
========================================================= */

function renderPlots(){

  const root=
    document.getElementById(
      "plots"
    );

  let html="";

  for(let i=0;i<MAX_PLOTS;i++){

    /* LÅST TOMT */

    if(i>=state.plots){

      const price=
        plotPrice(i);

      html+=`

        <div
          class="plot locked"
          onclick="buyPlot(${i})"
        >

          <div class="lock">
            🔒
          </div>

          <div class="plot-name">
            Tomt ${i+1}
          </div>

          <div>
            Klikk for å kjøpe
          </div>

          <div class="plot-price">
            ${fmt(price)} penger
          </div>

        </div>

      `;

      continue;

    }

    const plot=
      state.plants[i];

    /* TOM TOMT */

    if(!plot){

      html+=`

        <div
          class="plot unlocked"
          onclick="plantPlot(${i})"
        >

          <div class="plant-icon">
            🌱
          </div>

          <div class="plot-name">
            Tomt ${i+1}
          </div>

          <div>
            Velg et frø først
          </div>

        </div>

      `;

      continue;

    }

    const seed=
      getSeed(plot.plantId);

    if(!seed){

      html+=`

        <div class="plot unlocked">

          <div>
            ⚠️
          </div>

          <div>
            Ugyldig plante
          </div>

        </div>

      `;

      continue;

    }

    const progress=
      clamp(
        plot.progress/seed.time,
        0,
        1
      )*100;

    const ready=
      progress>=100;

    let mutationText="";

    if(plot.mutation){

      mutationText=
        `${plot.mutation.icon}
         ${plot.mutation.name}
         ×${plot.mutation.multiplier}`;

    }else if(ready){

      mutationText=
        "✨ Mutasjon trekkes ved høsting";

    }

    html+=`

      <div
        class="plot unlocked"
        onclick="plantPlot(${i})"
      >

        <div class="plant-icon">
          ${seed.icon}
        </div>

        <div class="plant-name">
          ${seed.name}
        </div>

        <div
          class="${rarityClass(seed.rarity)}"
        >
          ${seed.rarity}
        </div>

        <div class="progress">

          <div
            class="progress-fill"
            style="width:${progress}%"
          ></div>

        </div>

        ${
          ready

          ?

          `
            <div class="ready">
              ✨ KLAR!
              Klikk for å høste
            </div>
          `

          :

          `
            <div>
              ${Math.floor(progress)}%
            </div>
          `
        }

        ${
          mutationText

          ?

          `
            <div class="mutation">
              ${mutationText}
            </div>
          `

          :

          ""
        }

      </div>

    `;

  }

  root.innerHTML=html;

}


/* =========================================================
   AUTOSAVE
========================================================= */

window.addEventListener(
  "beforeunload",
  save
);


/* =========================================================
   START
========================================================= */

load();


/*
   Dersom det allerede finnes en save,
   starter spillet direkte etter reload.
*/

if(
  localStorage.getItem(SAVE_KEY)
  &&state.username
){

  document
    .getElementById("startScreen")
    .classList.add("hidden");

  document
    .getElementById("game")
    .classList.remove("hidden");

  gameRunning=true;

  render();

  setupWeatherVisuals();

  tickTimer=
    setInterval(
      gameTick,
      1000
    );

}
</script>

</body>
</html>
```
