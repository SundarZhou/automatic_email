module ApplicationHelper
  def full_title(page_title, base_title = '系统')
    if page_title.empty?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  def notice_message
    alert_types = { notice: :success, alert: :danger }

    close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_button = content_tag(:button, "×", close_button_options)

    alerts = flash.map do |type, message|
      alert_content = close_button + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end

    alerts.join("\n").html_safe
  end

  def credit_arr
    ['banks', 'currencies', 'credit_cards', 'credit_card_records', 'repayment_records']
  end

  def main_nav
    %Q[
      <li class="#{'active' if controller_name == 'dashboard'}">#{link_to '控制面板', root_path}</li>
      <li class="#{'active' if credit_arr.include?(controller_name)}">#{link_to '信用卡相关', banks_path}</li>
    ]
  end

  def side_nav
    nav_html = if controller_name == 'dashboard'
      %Q[
        <li class="#{'active' if controller_name == 'dashboard'}">#{link_to "控制面板", root_path}</li>
      ]
    elsif credit_arr.include? controller_name
      %Q[
        <li class="#{'active' if controller_name == 'banks'}">#{link_to "银行", banks_path}</li>
        <li class="#{'active' if controller_name == 'currencies'}">#{link_to "币种", currencies_path}</li>
        <li class="#{'active' if controller_name == 'credit_cards'}">#{link_to "卡号", credit_cards_path}</li>
        <li class="#{'active' if controller_name == 'credit_card_records'}">#{link_to "刷卡记录", credit_card_records_path}</li>
        <li class="#{'active' if controller_name == 'repayment_records'}">#{link_to "还款记录", repayment_records_path}</li>
      ]
    end
  end
end
