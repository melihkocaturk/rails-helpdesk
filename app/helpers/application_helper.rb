module ApplicationHelper
  def flash_class_for key
    { success: "success", error: "danger", alert: "warning", notice: "info" }[key.to_sym] || key.to_s
  end

  def status_class_for status
    { pending: "warning", open: "success", closed: "light" }[status.to_sym] || status.to_s
  end

  def priority_class_for priority
    { low: "light", medium: "warning", high: "danger" }[priority.to_sym] || priority.to_s
  end
end
