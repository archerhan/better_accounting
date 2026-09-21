/// 英文文案.
///
/// 只翻译了界面上的通用文案, 分类名(icon名字)暂时保留中文 ——
/// GetX 会按 key 回退到 fallbackLocale(zh_CN), 所以这里没写的 key
/// 依然会显示中文, 不会出现 key 直接露在外面的情况.
class EN {
  static const Map<String, String> enMap = {
    // 通用
    "common_year": "",
    "common_month": "",
    "common_day": "",
    "common_ok": "OK",
    "common_cancel": "Cancel",
    "common_today": "Today",
    "common_done": "Done",
    // 近期记账
    "accounts_expenses": "Expense",
    "accounts_income": "Income",
    "accounts_balance": "Balance:",
    "accounts_more_analyze": "More analytics >>",
    "accounts_empty": "No records this month",
    "accounts_empty_hint": "Tap + below to add one",
    "accounts_empty_tip": "No expense yet this month",
    "accounts_month_tip":
        "You spent ￥@amount on @category this month, let's save a bit more~",
    "accounts_memo_hint": "Note (optional)",
    // 收支分析
    "accounts_chart_title": "Analytics",
    "accounts_chart_daily": "Daily expense",
    "accounts_chart_ranking": "Top categories",
    "accounts_chart_empty": "No expense data this month",
    // 类别
    "category_setting": "Categories",
    // 设置
    "settings_title": "Settings",
    "settings_general": "General",
    "settings_data": "Data",
    "settings_about_section": "About",
    "settings_language": "Language",
    "settings_language_zh": "简体中文",
    "settings_language_en": "English",
    "settings_overview": "Overview (this month)",
    "settings_record_count": "Records",
    "settings_icon_count": "@count categories",
    "settings_reset_mock": "Regenerate demo data",
    "settings_reset_mock_desc": "Clear all records and generate demo data again",
    "settings_reset_mock_confirm":
        "All current records will be cleared and demo data will be generated again. Continue?",
    "settings_reset_mock_done": "Demo data regenerated",
    "settings_about": "About Better记账",
    "settings_about_desc": "Better记账 - a better bookkeeping app",
  };
}
