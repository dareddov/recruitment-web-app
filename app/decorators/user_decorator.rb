class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def destroy_icon
    if can?(:destroy, object)
      content_tag(:td) do
        link_to object, method: :delete, data: { confirm: t('common.confirmation') } do
          fa_icon('trash')
        end
      end.html_safe
    end
  end
end
