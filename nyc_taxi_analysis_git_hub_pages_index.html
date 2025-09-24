<!doctype html>
<html lang="ja" class="scroll-smooth">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>NYC Taxi Analysis | Sho</title>
  <meta name="description" content="BigQuery × Power BI で行った NYC タクシー2019年データの分析。ゾーン×時間×曜日の事実テーブル、ペルソナ別インサイト、広告施策の提案まで。" />
  <meta property="og:title" content="NYC Taxi Analysis | Sho" />
  <meta property="og:description" content="BigQuery × Power BI で行った NYC タクシー2019年データの分析。ゾーン×時間×曜日の事実テーブル、ペルソナ別インサイト、広告施策の提案まで。" />
  <meta property="og:type" content="website" />
  <meta property="og:url" content="https://example.github.io/nyc-taxi-analysis/" />
  <meta property="og:image" content="https://images.unsplash.com/photo-1518306727298-4c97f54bd86f?q=80&w=1200&auto=format&fit=crop" />
  <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='0.9em' font-size='90'>🚕</text></svg>">
  <!-- Tailwind (Play CDN: 手軽さ優先／本番ではビルド推奨) -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          fontFamily: {
            sans: ["Inter", "system-ui", "-apple-system", "Segoe UI", "Noto Sans JP", "sans-serif"],
          },
        }
      }
    }
  </script>
  <style>
    /* コードブロックを少し見やすく */
    pre { white-space: pre-wrap; }
  </style>
</head>
<body class="bg-slate-50 text-slate-800">
  <!-- Header -->
  <header class="sticky top-0 z-40 backdrop-blur bg-white/75 border-b border-slate-200">
    <div class="max-w-6xl mx-auto px-4 py-3 flex items-center justify-between">
      <a href="#top" class="font-semibold">NYC Taxi Analysis</a>
      <nav class="hidden md:flex gap-6 text-sm">
        <a href="#overview" class="hover:text-slate-900">概要</a>
        <a href="#dataset" class="hover:text-slate-900">データ</a>
        <a href="#model" class="hover:text-slate-900">データモデル</a>
        <a href="#queries" class="hover:text-slate-900">SQL</a>
        <a href="#insights" class="hover:text-slate-900">インサイト</a>
        <a href="#dashboard" class="hover:text-slate-900">ダッシュボード</a>
        <a href="#repro" class="hover:text-slate-900">再現手順</a>
        <a href="#about" class="hover:text-slate-900">作者</a>
      </nav>
    </div>
  </header>

  <!-- Hero -->
  <section id="top" class="relative">
    <div class="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1488747279002-c8523379faaa?q=80&w=1600&auto=format&fit=crop')] bg-cover bg-center opacity-30"></div>
    <div class="max-w-6xl mx-auto px-4 py-20 md:py-28 relative">
      <h1 class="text-3xl md:text-5xl font-bold tracking-tight">NYC タクシー乗車データ分析（2019）</h1>
      <p class="mt-4 md:text-lg text-slate-700 max-w-3xl">BigQuery で集計・整形し、<span class="font-semibold">ゾーン×時間×曜日</span>の事実テーブルを構築。Power BI で可視化し、
        車内デジタルサイネージ広告の最適化に向けたペルソナ別インサイトを抽出しました。</p>
      <div class="mt-6 flex gap-3">
        <a href="#dashboard" class="px-4 py-2 rounded-xl bg-slate-900 text-white hover:opacity-90">ダッシュボードを見る</a>
        <a href="#repro" class="px-4 py-2 rounded-xl border border-slate-300 hover:bg-white">再現手順へ</a>
      </div>
    </div>
  </section>

  <!-- Overview -->
  <section id="overview" class="max-w-6xl mx-auto px-4 py-14">
    <div class="grid md:grid-cols-5 gap-8 items-start">
      <div class="md:col-span-3">
        <h2 class="text-2xl font-bold">概要</h2>
        <p class="mt-3 leading-7">本プロジェクトは、ニューヨーク市のタクシー乗車データ（Yellow Taxi, 2019）を用い、
          需要の<strong>時間・曜日・エリア</strong>による変動を定量化し、
          車内広告の配信戦略（表示タイミング・場所・ペルソナ）に反映することを目的としています。</p>
        <ul class="mt-4 list-disc pl-6 space-y-2">
          <li>使用基盤：<strong>Google BigQuery</strong>（前処理・集計）、<strong>Power BI</strong>（可視化）</li>
          <li>コア設計：<code class="bg-slate-100 px-1 rounded">fact_trip_zone_hour_2019</code>（zone × hour × weekday の集計）</li>
          <li>主な観点：乗車数、平均運賃、平均距離、チップ、平日/休日差分</li>
          <li>成果物：ダッシュボード、ペルソナ別提案、SQLスクリプト</li>
        </ul>
      </div>
      <aside class="md:col-span-2 bg-white border border-slate-200 rounded-2xl p-5 shadow-sm">
        <h3 class="font-semibold">ハイライト</h3>
        <ul class="mt-3 space-y-3 text-sm">
          <li>マンハッタンは <em>通勤帯(7–9時/17–19時)</em> に需要ピーク</li>
          <li>平日夜間のミッドタウン周辺で <em>チップ率が相対的に高い</em></li>
          <li>高齢者想定ペルソナでは <em>日中帯(10–15時)</em> の安定需要を活用</li>
        </ul>
      </aside>
    </div>
  </section>

  <!-- Dataset -->
  <section id="dataset" class="bg-white border-y border-slate-200">
    <div class="max-w-6xl mx-auto px-4 py-14">
      <h2 class="text-2xl font-bold">データセット</h2>
      <p class="mt-3">BigQuery Public Datasets の <code class="bg-slate-100 px-1 rounded">bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips</code> を使用。
        前処理で無効値・極端値の扱いを行い、ゾーンマスタの付与を経て、分析用集計を作成しました。</p>
      <div class="mt-6 grid md:grid-cols-3 gap-6">
        <div class="p-5 rounded-2xl border border-slate-200 bg-slate-50">
          <h3 class="font-semibold">期間</h3>
          <p class="mt-2 text-sm">2019年（年間）</p>
        </div>
        <div class="p-5 rounded-2xl border border-slate-200 bg-slate-50">
          <h3 class="font-semibold">主な指標</h3>
          <p class="mt-2 text-sm">trip_count / avg_fare / avg_distance / tip_rate</p>
        </div>
        <div class="p-5 rounded-2xl border border-slate-200 bg-slate-50">
          <h3 class="font-semibold">空間単位</h3>
          <p class="mt-2 text-sm">NYC Taxi Zone（マンハッタン中心に分析）</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Data Model -->
  <section id="model" class="max-w-6xl mx-auto px-4 py-14">
    <h2 class="text-2xl font-bold">データモデル（要点）</h2>
    <div class="mt-4 grid md:grid-cols-2 gap-6">
      <div class="p-5 rounded-2xl border border-slate-200 bg-white shadow-sm">
        <h3 class="font-semibold">事実テーブル</h3>
        <p class="mt-2 text-sm"><code>fact_trip_zone_hour_2019</code>：<br/>zone_id × hour × weekday の粒度で、乗車数や平均運賃等の集計を保持。</p>
        <ul class="mt-3 list-disc pl-6 text-sm space-y-1">
          <li>trip_count, avg_fare, avg_distance, avg_tip_amount, tip_rate</li>
          <li>weekday（0=Mon … 6=Sun）, daytype（weekday/holiday）</li>
        </ul>
      </div>
      <div class="p-5 rounded-2xl border border-slate-200 bg-white shadow-sm">
        <h3 class="font-semibold">ディメンション</h3>
        <ul class="mt-2 list-disc pl-6 text-sm space-y-1">
          <li><code>dim_zone</code>：ゾーン名称・緯度経度等（マップ用）</li>
          <li><code>dim_time</code>：hour/weekday/日付属性</li>
          <li><code>dim_daytype</code>：平日/休日区分</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- Queries -->
  <section id="queries" class="bg-white border-y border-slate-200">
    <div class="max-w-6xl mx-auto px-4 py-14">
      <h2 class="text-2xl font-bold">主要SQL（抜粋・概略）</h2>
      <details class="mt-4 group">
        <summary class="cursor-pointer select-none py-3 px-4 bg-slate-100 rounded-xl font-medium">fact_trip_zone_hour_2019（生成ロジックの概略）</summary>
        <div class="mt-3 bg-slate-50 border border-slate-200 rounded-xl p-4 text-sm">
<pre><code>-- 概略：ピックアップ時刻から hour / weekday を生成し、
-- zone × hour × weekday で集計
CREATE OR REPLACE TABLE dataset.fact_trip_zone_hour_2019 AS
SELECT
  pickup_zone_id AS zone_id,
  EXTRACT(HOUR FROM pickup_datetime) AS hour,
  EXTRACT(DAYOFWEEK FROM pickup_datetime) - 1 AS weekday, -- 0=Sun 形式なら調整
  COUNT(*) AS trip_count,
  AVG(fare_amount) AS avg_fare,
  AVG(trip_distance) AS avg_distance,
  AVG(tip_amount) AS avg_tip_amount,
  SAFE_DIVIDE(SUM(tip_amount), SUM(fare_amount)) AS tip_rate
FROM bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips
WHERE EXTRACT(YEAR FROM pickup_datetime) = 2019
  AND fare_amount BETWEEN 0 AND 500
  AND trip_distance BETWEEN 0 AND 100
GROUP BY 1,2,3;</code></pre>
        </div>
      </details>

      <details class="mt-4 group">
        <summary class="cursor-pointer select-none py-3 px-4 bg-slate-100 rounded-xl font-medium">平日/休日 比較指標（例）</summary>
        <div class="mt-3 bg-slate-50 border border-slate-200 rounded-xl p-4 text-sm">
<pre><code>-- 平日平均と休日平均をゾーン×時間で比較
WITH base AS (
  SELECT zone_id, hour,
         AVG(IF(daytype = 'weekday', trip_count, NULL)) AS wk_trips,
         AVG(IF(daytype = 'holiday', trip_count, NULL)) AS hd_trips
  FROM dataset.fact_trip_zone_hour_2019_enriched
  GROUP BY 1,2
)
SELECT *, SAFE_DIVIDE(hd_trips - wk_trips, wk_trips) AS change_rate
FROM base; </code></pre>
        </div>
      </details>

      <details class="mt-4 group">
        <summary class="cursor-pointer select-none py-3 px-4 bg-slate-100 rounded-xl font-medium">ゾーン地図可視化用テーブル（例）</summary>
        <div class="mt-3 bg-slate-50 border border-slate-200 rounded-xl p-4 text-sm">
<pre><code>-- dim_zone と結合して緯度経度を付与し、地図表示を容易に
CREATE OR REPLACE VIEW dataset.pickup_zone_avg_trips_with_coords_2019 AS
SELECT f.zone_id, z.zone_name, z.lat, z.lng,
       AVG(f.trip_count) AS avg_trips
FROM dataset.fact_trip_zone_hour_2019 f
JOIN dataset.dim_zone z USING(zone_id)
GROUP BY 1,2,3,4; </code></pre>
        </div>
      </details>

      <p class="mt-6 text-sm text-slate-600">※ 実プロジェクトではクレンジング・外れ値処理・祝日補正などを加えています。</p>
    </div>
  </section>

  <!-- Insights / Personas -->
  <section id="insights" class="max-w-6xl mx-auto px-4 py-14">
    <h2 class="text-2xl font-bold">インサイト（ペルソナ別）</h2>
    <div class="mt-6 grid md:grid-cols-3 gap-6">
      <div class="p-6 rounded-2xl border border-slate-200 bg-white shadow-sm">
        <h3 class="font-semibold">① ビジネスマン通勤</h3>
        <ul class="mt-2 text-sm list-disc pl-6 space-y-1">
          <li>対象：平日 7–9時 / 17–19時、ロウアー・ミッドタウン中心</li>
          <li>訴求：朝のニュースヘッドライン、コーヒー/朝食、Rideshare連携</li>
          <li>KPI：通勤帯でのCTR/CPM、曜日別差分</li>
        </ul>
      </div>
      <div class="p-6 rounded-2xl border border-slate-200 bg-white shadow-sm">
        <h3 class="font-semibold">③ ナイトライフ利用者</h3>
        <ul class="mt-2 text-sm list-disc pl-6 space-y-1">
          <li>対象：平日/週末 20–24時、劇場街・バー密集エリア</li>
          <li>訴求：飲食/エンタメ、ショーのラストミニッツ枠</li>
          <li>KPI：夜間帯のチップ率・回遊率</li>
        </ul>
      </div>
      <div class="p-6 rounded-2xl border border-slate-200 bg-white shadow-sm">
        <h3 class="font-semibold">④ 高齢者（UWS居住）</h3>
        <ul class="mt-2 text-sm list-disc pl-6 space-y-1">
          <li>対象：平日 10–15時、通院・公園・図書館アクセス</li>
          <li>訴求：金融/医療/生活サービス、乗換少ないルート案内</li>
          <li>KPI：日中帯の到達頻度・広告想起</li>
        </ul>
      </div>
    </div>
    <p class="mt-6 text-sm text-slate-600">※ ② 観光客はセグメントの粒度が合わず除外（本分析軸：曜日・時間帯・マンハッタンCD）。</p>
  </section>

  <!-- Dashboard link(s) -->
  <section id="dashboard" class="bg-white border-y border-slate-200">
    <div class="max-w-6xl mx-auto px-4 py-14">
      <h2 class="text-2xl font-bold">ダッシュボード</h2>
      <p class="mt-3">Power BI の公開リンク（またはスクリーンショット）をここに配置します。Looker Studio を併用する場合も同様に配置可能です。</p>
      <div class="mt-6 grid md:grid-cols-2 gap-6">
        <a class="block group" href="#" target="_blank" rel="noopener">
          <div class="aspect-video rounded-2xl overflow-hidden border border-slate-200 shadow-sm">
            <img class="w-full h-full object-cover group-hover:opacity-90" alt="dashboard preview" src="https://images.unsplash.com/photo-1551281044-8c5f0c0e52d3?q=80&w=1200&auto=format&fit=crop" />
          </div>
          <div class="mt-2 text-sm text-slate-600">（例）マンハッタン ペルソナ別 需要マップ</div>
        </a>
        <a class="block group" href="#" target="_blank" rel="noopener">
          <div class="aspect-video rounded-2xl overflow-hidden border border-slate-200 shadow-sm">
            <img class="w-full h-full object-cover group-hover:opacity-90" alt="dashboard preview" src="https://images.unsplash.com/photo-1454165205744-3b78555e5572?q=80&w=1200&auto=format&fit=crop" />
          </div>
          <div class="mt-2 text-sm text-slate-600">（例）時間帯×ゾーン 指標トレンド</div>
        </a>
      </div>
    </div>
  </section>

  <!-- Repro steps -->
  <section id="repro" class="max-w-6xl mx-auto px-4 py-14">
    <h2 class="text-2xl font-bold">再現手順（概要）</h2>
    <ol class="mt-4 list-decimal pl-6 space-y-3">
      <li><strong>BigQuery</strong>：public dataset を参照し、必要列を抽出・クレンジング</li>
      <li><strong>集計</strong>：<code>fact_trip_zone_hour_2019</code> を作成、補助ビューを生成</li>
      <li><strong>可視化</strong>：Power BI / Looker Studio に接続してダッシュボード作成</li>
      <li><strong>提案</strong>：ペルソナ別に広告配信の時間・場所・クリエイティブを設計</li>
    </ol>

    <div class="mt-6 p-4 rounded-xl bg-slate-100 border border-slate-200 text-sm">
      GitHub Pages への掲載方法：この <code>index.html</code> をリポジトリに配置し、Settings → Pages で公開するだけです。
      プロジェクトサイトの場合は <em>https://ユーザー名.github.io/リポジトリ名/</em> で閲覧できます。
    </div>
  </section>

  <!-- About -->
  <section id="about" class="bg-white border-y border-slate-200">
    <div class="max-w-6xl mx-auto px-4 py-14">
      <h2 class="text-2xl font-bold">作者</h2>
      <div class="mt-4 grid md:grid-cols-3 gap-6 items-start">
        <div class="md:col-span-2">
          <p class="leading-7">神奈川県在住。データ分析・可視化・提案まで一貫して行うことを目標に、BigQuery/SQL・BI を中心に学習・実践しています。
            本プロジェクトでは、実務を意識したデータモデル設計と、意思決定につながるインサイト抽出を重視しました。</p>
          <ul class="mt-4 text-sm list-disc pl-6 space-y-1">
            <li>Skills：BigQuery / SQL / Power BI / Python（基礎）</li>
            <li>Focus：データモデル設計、指標設計、ビジネス提案</li>
          </ul>
        </div>
        <div class="bg-slate-50 border border-slate-200 rounded-2xl p-5">
          <h3 class="font-semibold">連絡先</h3>
          <ul class="mt-2 text-sm space-y-1">
            <li>GitHub：<a class="underline" href="#" target="_blank">@your-github</a></li>
            <li>Mail：<a class="underline" href="mailto:example@example.com">example@example.com</a></li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <footer class="max-w-6xl mx-auto px-4 py-10 text-sm text-slate-500">
    © <span id="y"></span> Sho — NYC Taxi Analysis
  </footer>

  <script>
    document.getElementById('y').textContent = new Date().getFullYear()
  </script>
</body>
</html>
