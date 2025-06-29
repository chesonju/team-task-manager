# 🧠 Team Task Manager

Ruby on Rails + Vue.js を使った、簡易タスク共有SaaSツールです。  
チームごとにタスクを管理し、進捗状況を可視化できます。

## 🚀 使用技術スタック

| 分類           | 技術                         |
|----------------|------------------------------|
| バックエンド    | Ruby on Rails (API mode)     |
| フロントエンド  | Vue.js 3 + Vite              |
| データベース    | PostgreSQL / SQLite3         |
| 状態管理        | Pinia                        |
| 認証            | JWT                          |
| バッチ処理      | Rake task                    |

## 📚 設計書（Notion）

仕様の詳細は以下のNotionページをご覧ください。  
ER図・モデル構造・API設計・進捗などをまとめています。

🔗 [Notion設計書を見る](https://www.notion.so/Team-Task-Manager-221d98e6f7f0803da103dcde2890d51c?source=copy_link)

## 📦 セットアップ手順

```bash
# バックエンド
cd backend
bundle install
rails db:create db:migrate
rails server

# フロントエンド
cd frontend
npm install
npm run dev
